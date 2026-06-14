-- Таблица 1: users
-- Назначение: хранение пользователей системы: мастера и клиентов

CREATE TABLE users (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    user_type ENUM('master', 'client') NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_users PRIMARY KEY (id),
    CONSTRAINT chk_users_name_not_empty CHECK (CHAR_LENGTH(TRIM(name)) > 0),
    CONSTRAINT chk_users_name_format CHECK (name REGEXP '^[А-Яа-яЁёA-Za-z -]+$')
);

CREATE INDEX idx_users_user_type ON users (user_type);

-- Таблица 2: procedure_categories
-- Назначение: хранение категорий процедур

CREATE TABLE procedure_categories (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_procedure_categories PRIMARY KEY (id),
    CONSTRAINT uq_procedure_categories_name UNIQUE (name),
    CONSTRAINT chk_procedure_categories_name_not_empty CHECK (CHAR_LENGTH(TRIM(name)) > 0)
);

-- Таблица 3: procedures
-- Назначение: хранение информации о процедурах, предоставляемых мастерами

CREATE TABLE procedures (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_id BIGINT UNSIGNED NOT NULL,
    master_user_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(500) NULL,
    price DECIMAL(10, 2) NOT NULL,
    duration INT UNSIGNED NOT NULL,
    status ENUM('available', 'unavailable') NOT NULL DEFAULT 'available',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_procedures PRIMARY KEY (id),
    CONSTRAINT fk_procedures_categories FOREIGN KEY (category_id) REFERENCES procedure_categories(id)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CONSTRAINT fk_procedures_masters FOREIGN KEY (master_user_id) REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT uq_procedures_category_name UNIQUE (category_id, name),
    CONSTRAINT chk_procedures_price CHECK (price >= 0),
    CONSTRAINT chk_procedures_duration CHECK (duration > 0),
    CONSTRAINT chk_procedures_name_not_empty CHECK (CHAR_LENGTH(TRIM(name)) > 0),
    CONSTRAINT chk_procedures_name_format CHECK (name REGEXP '^[А-Яа-яЁёA-Za-z0-9 .,+()/-]+$')
);

CREATE INDEX idx_procedures_category_status ON procedures (category_id, status);

-- Таблица 4: schedules
-- Назначение: хранение информации о расписании мастера

CREATE TABLE schedules (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    master_user_id BIGINT UNSIGNED NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_schedules PRIMARY KEY (id),
    CONSTRAINT fk_schedules_masters FOREIGN KEY (master_user_id) REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_schedules_date CHECK (date_from <= date_to)
);

CREATE INDEX idx_schedules_master_date ON schedules (master_user_id, date_from, date_to);

-- Таблица 5: schedule_days
-- Назначение: хранение информации о днях расписания мастера

CREATE TABLE schedule_days (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    schedule_id BIGINT UNSIGNED NOT NULL,
    work_date DATE NOT NULL,
    is_working BOOLEAN NOT NULL DEFAULT true, 
    start_time TIME NULL,
    end_time TIME NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_schedule_days PRIMARY KEY (id),
    CONSTRAINT fk_schedule_days_schedule FOREIGN KEY (schedule_id) REFERENCES schedules(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT uq_schedule_days_schedule_date UNIQUE (schedule_id, work_date),
    CONSTRAINT chk_schedule_days_working_time CHECK (
        (is_working = true AND start_time IS NOT NULL AND end_time IS NOT NULL AND start_time < end_time)
        OR
        (is_working = false AND start_time IS NULL AND end_time IS NULL)
    )
);

-- Таблица 6: unavailable_periods
-- Назначение: хранение информации о недоступных периодах

CREATE TABLE unavailable_periods (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    schedule_day_id BIGINT UNSIGNED NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    reason VARCHAR(255) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_unavailable_periods PRIMARY KEY (id),
    CONSTRAINT fk_unavailable_periods_schedule_days FOREIGN KEY (schedule_day_id) REFERENCES schedule_days(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_unavailable_periods_time CHECK (start_time < end_time),
    CONSTRAINT uq_unavailable_periods_schedule_day_time UNIQUE (schedule_day_id, start_time, end_time)
);

-- Таблица 7: bookings
-- Назначение: хранение информации о записях, сделанных клиентами на процедуры мастера

CREATE TABLE bookings (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    procedure_id BIGINT UNSIGNED NOT NULL,
    schedule_day_id BIGINT UNSIGNED NOT NULL,
    client_user_id BIGINT UNSIGNED NOT NULL,
    start_time TIME NOT NULL, 
    end_time TIME NOT NULL,
    fixed_price DECIMAL(10,2) NOT NULL,
    status ENUM('created', 'canceled') NOT NULL DEFAULT 'created',
    access_token VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    canceled_at DATETIME NULL,
    CONSTRAINT pk_bookings PRIMARY KEY (id),
    CONSTRAINT fk_bookings_procedures FOREIGN KEY (procedure_id) REFERENCES procedures(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_bookings_schedule_days FOREIGN KEY (schedule_day_id) REFERENCES schedule_days(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_bookings_clients FOREIGN KEY (client_user_id) REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_bookings_time_range CHECK(start_time < end_time),
    CONSTRAINT chk_bookings_fixed_price CHECK (fixed_price >= 0),
    CONSTRAINT uq_bookings_access_token UNIQUE (access_token),
    CONSTRAINT chk_bookings_access_token CHECK (CHAR_LENGTH(TRIM(access_token)) > 0),
    CONSTRAINT chk_bookings_canceled_at CHECK (
        (status = 'created' AND canceled_at IS NULL)
        OR
        (status = 'canceled' AND canceled_at IS NOT NULL)
    )
);

CREATE INDEX idx_bookings_schedule_day_status_time ON bookings (schedule_day_id, status, start_time, end_time);
CREATE INDEX idx_bookings_client_status_created_at ON bookings (client_user_id, status, created_at);


-- Таблица 8: notifications
-- Назначение: хранение информации об уведомлениях

CREATE TABLE notifications (
    id  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    booking_id BIGINT UNSIGNED NOT NULL,
    recipient_user_id BIGINT UNSIGNED NOT NULL,
    notification_type ENUM('master_booking_created', 'client_booking_created', 'master_booking_canceled', 'client_booking_canceled', 'client_booking_reminder') NOT NULL,
    message_text TEXT NOT NULL,
    status ENUM('created', 'sent', 'delivered', 'error')  NOT NULL DEFAULT 'created',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    sent_at DATETIME NULL,
    CONSTRAINT pk_notifications PRIMARY KEY (id),
    CONSTRAINT fk_notifications_bookings FOREIGN KEY (booking_id) REFERENCES bookings(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_notifications_users FOREIGN KEY (recipient_user_id) REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT uq_notifications_booking_recipient_type UNIQUE (booking_id, recipient_user_id, notification_type),
    CONSTRAINT chk_notifications_message_text_not_empty CHECK (CHAR_LENGTH(TRIM(message_text)) > 0),
    CONSTRAINT chk_notification_sent_at CHECK (
        (status IN ('created', 'error') AND sent_at IS NULL)
        OR
        (status IN ('sent', 'delivered') AND sent_at IS NOT NULL)
    )
);

CREATE INDEX idx_notifications_status_created_at ON notifications (status, created_at);

-- Таблица 9: channel_types
-- Назначение: хранение типов каналов связи

CREATE TABLE channel_types (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    code ENUM('phone', 'telegram', 'email', 'vk', 'max') NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_channel_types PRIMARY KEY (id),
    CONSTRAINT uq_channel_types_code UNIQUE (code),
    CONSTRAINT chk_channel_types_name_not_empty CHECK (CHAR_LENGTH(TRIM(name)) > 0)
);

-- Таблица 10: contact_channels
-- Назначение: хранение информации о каналах связи

CREATE TABLE contact_channels (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id BIGINT UNSIGNED NOT NULL,
    channel_type_id BIGINT UNSIGNED NOT NULL,
    value VARCHAR(255) NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT false,
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_contact_channels PRIMARY KEY (id),
    CONSTRAINT fk_contact_channels_users FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_contact_channels_type FOREIGN KEY (channel_type_id) REFERENCES channel_types(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_contact_channels_value CHECK (CHAR_LENGTH(TRIM(value)) > 0),
    CONSTRAINT uq_contact_channels_user_type_value UNIQUE (user_id, channel_type_id, value)
);

CREATE INDEX idx_contact_channels_user_status ON contact_channels (user_id, status);