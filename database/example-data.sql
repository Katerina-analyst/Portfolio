-- 1. procedure_categories
insert into procedure_categories (id, category_name) values
    (1, 'Инъекционная косметология'),
    (2, 'Аппаратная и эстетическая косметология'),
    (3, 'Перманентный макияж'),
    (4, 'Консультации');

-- 2. channel_types
insert into channel_types (id, code, channel_name) values
    (1, 'phone', 'Телефон'),
    (2, 'email', 'Email'),
    (3, 'vk', 'VK'),
    (4, 'max', 'MAX');
    
-- 3. users

-- Мастер
insert into users (
    id,
    full_name,
    user_type,
    login,
    password_hash
) values (
    1,
    'Анна Смирнова',
    'master',
    'anna.smirnova',
    'REPLACE_WITH_PASSWORD_HASH'
);

-- Клиенты
insert into users (id, full_name, user_type) values
    (2, 'Мария', 'client'),
    (3, 'Екатерина', 'client'),
    (4, 'Ольга', 'client'),
    (5, 'Наталья', 'client'),
    (6, 'Алина', 'client'),
    (7, 'Виктория', 'client'),
    (8, 'Ирина', 'client'),
    (9, 'Светлана', 'client'),
    (10, 'Дарья', 'client'),
    (11, 'Юлия', 'client'),
    (12, 'Полина', 'client'),
    (13, 'Вероника', 'client'),
    (14, 'Ксения', 'client'),
    (15, 'Татьяна', 'client'),
    (16, 'Елена', 'client');

-- 4. procedures
insert into procedures (id, category_id, master_user_id, procedure_name, description, price, duration_minutes, status) values
    (1, 1, 1, 'Лечение гипергидроза', 'Инъекционное подавление активности потовых желез', 8000.00, 60, 'available'),
    (2, 1, 1, 'Липолитик Lipo Lab 2 мл', 'Инъекционное расщепление жировых клеток в локальных зонах', 1800.00, 40, 'unavailable'),
    (3, 2, 1, 'RF-лифтинг', 'Прогрев тканей радиоволнами для уплотнения и подтяжки кожи без операции', 2500.00, 60, 'available'),
    (4, 2, 1, 'Пилинг Bio Re Peel', 'Кислотный пилинг для обновления кожи лица. Способствует выравниванию тона и улучшению текстуры кожи', 3500.00, 30, 'available'),
    (5, 3, 1, 'Перманент губ', 'Микропигментирование губ для стойкого оттенка и коррекции формы', 4000.00, 60, 'available');

-- 5. schedules
insert into schedules (id, master_user_id, date_from, date_to) values
    (1, 1, '2026-06-22', '2026-06-28');

-- 6. schedule_days
insert into schedule_days (id, schedule_id, work_date, is_working, start_time, end_time) values
    (1, 1, '2026-06-22', true, '10:00:00', '18:00:00'),
    (2, 1, '2026-06-23', true, '10:00:00', '18:00:00'),
    (3, 1, '2026-06-24', true, '09:00:00', '16:00:00'),
    (4, 1, '2026-06-25', true, '09:00:00', '20:00:00'),
    (5, 1, '2026-06-26', false, null, null),
    (6, 1, '2026-06-27', true, '09:00:00', '18:00:00'),
    (7, 1, '2026-06-28', true, '10:00:00', '18:00:00');

-- 7. unavailable_periods
insert into unavailable_periods (id, schedule_day_id, start_time, end_time, reason) values
    (1, 1, '12:00:00', '13:00:00', 'Перерыв'),
    (2, 4, '14:00:00', '16:00:00', 'Обучение'),
    (3, 6, '13:00:00', '14:00:00', 'Перерыв');

-- 8. bookings
insert into bookings (id, procedure_id, schedule_day_id, client_user_id, start_time, end_time, fixed_price, status, access_token, data_consent, canceled_at
) values
    (1, 1, 1, 2, '10:00:00', '11:00:00', 8000.00, 'created', 'booking-token-maria-001', true, null),
    (2, 3, 1, 3, '13:30:00', '14:30:00', 2500.00, 'created', 'booking-token-ekaterina-002', true, null),
    (3, 4, 2, 4, '10:30:00', '11:00:00', 3500.00, 'canceled', 'booking-token-olga-003', true, '2026-06-22 18:20:00'),
    (4, 5, 4, 5, '11:00:00', '12:00:00', 4000.00, 'created', 'booking-token-natalia-004', true, null),
    (5, 4, 1, 6, '11:00:00', '11:30:00', 3500.00, 'created', 'booking-token-alina-005', true, null),
    (6, 5, 1, 7, '14:30:00', '15:30:00', 4000.00, 'created', 'booking-token-victoria-006', true, null),
    (7, 1, 2, 8, '10:00:00', '11:00:00', 8000.00, 'created', 'booking-token-irina-007', true, null),
    (8, 3, 2, 9, '11:00:00', '12:00:00', 2500.00, 'created', 'booking-token-svetlana-008', true, null),
    (9, 4, 2, 10, '12:00:00', '12:30:00', 3500.00, 'created', 'booking-token-daria-009', true, null),
    (10, 1, 3, 11, '09:00:00', '10:00:00', 8000.00, 'created', 'booking-token-yulia-010', true, null),
    (11, 3, 3, 12, '10:30:00', '11:30:00', 2500.00, 'created', 'booking-token-polina-011', true, null),
    (12, 4, 3, 13, '12:00:00', '12:30:00', 3500.00, 'created', 'booking-token-veronika-012', true, null),
    (13, 5, 3, 14, '14:00:00', '15:00:00', 4000.00, 'created', 'booking-token-ksenia-013', true, null),
    (14, 3, 4, 15, '09:00:00', '10:00:00', 2500.00, 'created', 'booking-token-tatiana-014', true, null),
    (15, 4, 4, 16, '10:00:00', '10:30:00', 3500.00, 'created', 'booking-token-elena-015', true, null),
    (16, 1, 4, 2, '15:30:00', '16:30:00', 8000.00, 'created', 'booking-token-maria-016', true, null),
    (17, 5, 6, 3, '09:00:00', '10:00:00', 4000.00, 'created', 'booking-token-ekaterina-017', true, null),
    (18, 3, 6, 4, '10:00:00', '11:00:00', 2500.00, 'created', 'booking-token-olga-018', true, null),
    (19, 1, 7, 5, '10:00:00', '11:00:00', 8000.00, 'created', 'booking-token-natalia-019', true, null),
    (20, 4, 7, 6, '11:00:00', '11:30:00', 3500.00, 'created', 'booking-token-alina-020', true, null);

-- 9. notifications
insert into notifications (id, booking_id, recipient_user_id, notification_type, message_text, status, sent_at) values
    (1, 1, 1, 'master_booking_created', 'Новая запись: Мария записалась на процедуру «Лечение гипергидроза» 22.06.2026 в 10:00.', 'sent', '2026-06-21 10:01:00'),
    (2, 1, 2, 'client_booking_created', 'Мария, вы записаны на процедуру «Лечение гипергидроза» 22.06.2026 в 10:00. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-maria-001', 'delivered', '2026-06-21 10:01:00'),
    (3, 2, 1, 'master_booking_created', 'Новая запись: Екатерина записалась на процедуру «RF-лифтинг» 22.06.2026 в 13:30.', 'sent', '2026-06-21 10:15:00'),
    (4, 2, 3, 'client_booking_created', 'Екатерина, вы записаны на процедуру «RF-лифтинг» 22.06.2026 в 13:30. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-ekaterina-002', 'delivered', '2026-06-21 10:15:00'),
    (5, 3, 1, 'master_booking_canceled', 'Клиент Ольга отменила запись на процедуру «Пилинг Bio Re Peel» 23.06.2026 в 10:30.', 'sent', '2026-06-22 18:21:00'),
    (6, 4, 1, 'master_booking_created', 'Новая запись: Наталья записалась на процедуру «Перманент губ» 25.06.2026 в 11:00.', 'sent', '2026-06-21 11:05:00'),
    (7, 4, 5, 'client_booking_created', 'Наталья, вы записаны на процедуру «Перманент губ» 25.06.2026 в 11:00. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-natalia-004', 'delivered', '2026-06-21 11:05:00'),
    (8, 4, 5, 'client_booking_reminder', 'Наталья, напоминаем о визите 25.06.2026 в 11:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-natalia-004', 'created', null),
    (9, 5, 1, 'master_booking_created', 'Новая запись: Алина записалась на процедуру «Пилинг Bio Re Peel» 22.06.2026 в 11:00.', 'sent', '2026-06-21 11:20:00'),
    (10, 5, 6, 'client_booking_created', 'Алина, вы записаны на процедуру «Пилинг Bio Re Peel» 22.06.2026 в 11:00. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-alina-005', 'delivered', '2026-06-21 11:20:00'),
    (11, 6, 1, 'master_booking_created', 'Новая запись: Виктория записалась на процедуру «Перманент губ» 22.06.2026 в 14:30.', 'sent', '2026-06-21 12:10:00'),
    (12, 6, 7, 'client_booking_created', 'Виктория, вы записаны на процедуру «Перманент губ» 22.06.2026 в 14:30. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-victoria-006', 'delivered', '2026-06-21 12:10:00'),
    (13, 7, 8, 'client_booking_reminder', 'Ирина, напоминаем о визите 23.06.2026 в 10:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-irina-007', 'created', null),
    (14, 8, 9, 'client_booking_reminder', 'Светлана, напоминаем о визите 23.06.2026 в 11:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-svetlana-008', 'created', null),
    (15, 9, 10, 'client_booking_reminder', 'Дарья, напоминаем о визите 23.06.2026 в 12:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-daria-009', 'created', null),
    (16, 10, 1, 'master_booking_created', 'Новая запись: Юлия записалась на процедуру «Лечение гипергидроза» 24.06.2026 в 09:00.', 'sent', '2026-06-21 13:30:00'),
    (17, 10, 11, 'client_booking_created', 'Юлия, вы записаны на процедуру «Лечение гипергидроза» 24.06.2026 в 09:00. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-yulia-010', 'delivered', '2026-06-21 13:30:00'),
    (18, 11, 1, 'master_booking_created', 'Новая запись: Полина записалась на процедуру «RF-лифтинг» 24.06.2026 в 10:30.', 'sent', '2026-06-21 14:00:00'),
    (19, 11, 12, 'client_booking_created', 'Полина, вы записаны на процедуру «RF-лифтинг» 24.06.2026 в 10:30. Посмотреть или отменить запись можно по ссылке: https://beauty-bliss.ru/booking/booking-token-polina-011', 'delivered', '2026-06-21 14:00:00'),
    (20, 12, 13, 'client_booking_reminder', 'Вероника, напоминаем о визите 24.06.2026 в 12:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-veronika-012', 'created', null),
    (21, 13, 14, 'client_booking_reminder', 'Ксения, напоминаем о визите 24.06.2026 в 14:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-ksenia-013', 'created', null),
    (22, 17, 3, 'client_booking_reminder', 'Екатерина, напоминаем о визите 27.06.2026 в 09:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-ekaterina-017', 'created', null),
    (23, 19, 5, 'client_booking_reminder', 'Наталья, напоминаем о визите 28.06.2026 в 10:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-natalia-019', 'created', null),
    (24, 20, 6, 'client_booking_reminder', 'Алина, напоминаем о визите 28.06.2026 в 11:00. Посмотреть или отменить запись: https://beauty-bliss.ru/booking/booking-token-alina-020', 'created', null);

-- 10. contact_channels
insert into contact_channels (id, user_id, channel_type_id, value, status) values
    -- каналы связи мастера
    (1, 1, 1, '+79990000001','active'),
    (2, 1, 2, 'master@beauty-bliss.ru', 'active'),
    (3, 1, 3, 'https://vk.com/beauty_bliss_master', 'active'),
    (4, 1, 4, '@beauty_bliss_max', 'active'),

    -- каналы связи клиентов
    (5, 2, 1, '+79991111111','active'),
    (6, 3, 1, '+79992222222', 'active'),
    (7, 4, 1, '+79993333333', 'active'),
    (8, 5, 1, '+79994444444', 'active'),
    (9, 6, 1, '+79995555555', 'active'),
    (10, 7, 1, '+79996666666', 'active'),
    (11, 8, 1, '+79997777777', 'active'),
    (12, 9, 1, '+79998888888', 'active'),
    (13, 10, 1, '+79990001111', 'active'),
    (14, 11, 1, '+79990002222', 'active'),
    (15, 12, 1, '+79990003333', 'active'),
    (16, 13, 1, '+79990004444', 'active'),
    (17, 14, 1, '+79990005555', 'active'),
    (18, 15, 1, '+79990006666', 'active'),
    (19, 16, 1, '+79990007777', 'active');
-- синхронизация id-счётчиков после ручной вставки id, для корректного автоматического присвоения следующих id 

select setval(pg_get_serial_sequence('procedure_categories', 'id'), (select max(id) from procedure_categories));
select setval(pg_get_serial_sequence('channel_types', 'id'), (select max(id) from channel_types));
select setval(pg_get_serial_sequence('users', 'id'), (select max(id) from users));
select setval(pg_get_serial_sequence('procedures', 'id'), (select max(id) from procedures));
select setval(pg_get_serial_sequence('schedules', 'id'), (select max(id) from schedules));
select setval(pg_get_serial_sequence('schedule_days', 'id'), (select max(id) from schedule_days));
select setval(pg_get_serial_sequence('unavailable_periods', 'id'), (select max(id) from unavailable_periods));
select setval(pg_get_serial_sequence('bookings', 'id'), (select max(id) from bookings));
select setval(pg_get_serial_sequence('notifications', 'id'), (select max(id) from notifications));
select setval(pg_get_serial_sequence('contact_channels', 'id'), (select max(id) from contact_channels));
