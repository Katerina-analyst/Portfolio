-- 1. users

INSERT INTO users (id, full_name, user_type) VALUES
    (1, 'Анна Смирнова', 'master'),
    (2, 'Мария', 'client'),
    (3, 'Екатерина', 'client'),
    (4, 'Ольга', 'client'),
    (5, 'Наталья', 'client');

-- 2. procedure_categories

INSERT INTO procedure_categories (id, category_name) VALUES
    (1, 'Инъекционная косметология'),
    (2, 'Аппаратная и эстетическая косметология'),
    (3, 'Перманентный макияж');

-- 3. procedures

INSERT INTO procedures (id, category_id, master_user_id, procedure_name, description, price, duration, status) VALUES
    (1, 1, 1, 'Лечение гипергидроза', 'Инъекционное подавление активности потовых желез', 8000.00, 60, 'available'),
    (2, 1, 1, 'Липолитик Lipo Lab 2 мл', 'Инъекционное расщепление жировых клеток в локальных зонах', 1800.00, 40, 'unavailable'),
    (3, 2, 1, 'RF-лифтинг', 'Прогрев тканей радиоволнами для уплотнения и подтяжки кожи без операции', 2500.00, 60, 'available'),
    (4, 2, 1, 'Пилинг Bio Re Peel', 'Кислотный пилинг для обновления кожи лица. Способствует выравниванию тона и улучшению текстуры кожи', 3500.00, 30, 'available'),
    (5, 3, 1, 'Перманент губ', 'Микропигментирование губ для стойкого оттенка и коррекции формы', 4000.00, 60, 'available');

-- 4. schedules

INSERT INTO schedules (id, master_user_id, date_from, date_to) VALUES
    (1, 1, '2026-06-22', '2026-06-28');

-- 5. schedule_days

INSERT INTO schedule_days (id, schedule_id, work_date, is_working, start_time, end_time) VALUES
    (1, 1, '2026-06-22', true, '10:00:00', '18:00:00'),
    (2, 1, '2026-06-23', true, '10:00:00', '18:00:00'),
    (3, 1, '2026-06-24', true, '09:00:00', '16:00:00'),
    (4, 1, '2026-06-25', true, '09:00:00', '20:00:00'),
    (5, 1, '2026-06-26', false, NULL, NULL),
    (6, 1, '2026-06-27', true, '09:00:00', '18:00:00'),
    (7, 1, '2026-06-28', true, '10:00:00', '18:00:00');

-- 6. unavailable_periods

INSERT INTO unavailable_periods (id, schedule_day_id, start_time, end_time, reason) VALUES
    (1, 1, '12:00:00', '13:00:00', 'Перерыв'),
    (2, 4, '14:00:00', '16:00:00', 'Обучение'),
    (3, 6, '13:00:00', '14:00:00', 'Перерыв');

-- 7. bookings

INSERT INTO bookings (id, procedure_id, schedule_day_id, client_user_id, start_time, end_time, fixed_price, status, access_token, canceled_at) VALUES
    (1, 1, 1, 2, '10:00:00', '11:00:00', 8000.00, 'created', 'booking-token-maria-001', NULL),
    (2, 3, 1, 3, '13:30:00', '14:30:00', 2500.00, 'created', 'booking-token-ekaterina-002', NULL),
    (3, 4, 2, 4, '10:30:00', '11:00:00', 3500.00, 'canceled', 'booking-token-olga-003', '2026-06-22 18:20:00'),
    (4, 5, 4, 5, '11:00:00', '12:00:00', 4000.00, 'created', 'booking-token-natalia-004', NULL);

-- 8. notifications

INSERT INTO notifications (id, booking_id, recipient_user_id, notification_type, message_text, status, sent_at) VALUES
    (1, 1, 1, 'master_booking_created', 'Новая запись: Мария записалась на процедуру «Лечение гипергидроза» 22.06.2026 в 10:00.', 'sent', '2026-06-21 10:01:00'),
    (2, 1, 2, 'client_booking_created', 'Мария, вы записаны на процедуру «Лечение гипергидроза» 22.06.2026 в 10:00. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-maria-001', 'delivered', '2026-06-21 10:01:00'),
    (3, 3, 1, 'master_booking_canceled', 'Клиент Ольга отменил запись на процедуру «Пилинг Bio Re Peel» 23.06.2026 в 10:30.', 'sent', '2026-06-22 18:21:00'),
    (4, 4, 5, 'client_booking_reminder', 'Наталья, напоминаем о визите 25.06.2026 в 11:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-natalia-004', 'created', NULL);

-- 9. channel_types

INSERT INTO channel_types (id, code, channel_name) VALUES
    (1, 'phone', 'Телефон'),
    (2, 'email', 'Email'),
    (3, 'vk', 'VK'),
    (4, 'max', 'MAX');

-- 10. contact_channels

INSERT INTO contact_channels (id, user_id, channel_type_id, value, is_default, status) VALUES
    -- Каналы связи мастера
    (1, 1, 1, '+79990000001', true, 'active'),
    (2, 1, 2, 'master@beauty-bliss.ru', false, 'active'),
    (3, 1, 3, 'https://vk.com/beauty_bliss_master', false, 'active'),
    (4, 1, 4, '@beauty_bliss_max', false, 'active'),
    -- Каналы связи клиентов
    (5, 2, 1, '+79991111111', true, 'active'),
    (6, 3, 1, '+79992222222', true, 'active'),
    (7, 4, 1, '+79993333333', true, 'active'),
    (8, 5, 1, '+79994444444', true, 'active');