-- 1. Получение информации о доступных процедурах: категория, название, описание, цена. Сортировка по категории и цене по возрастанию
select p_c.category_name, p.procedure_name, p.description, p.price from procedures p
join procedure_categories p_c on p_c.id = p.category_id
where p.status = 'available'
order by p_c.category_name, p.price;

-- 2. Посмотр будущих записей для клиента Мария. Нужны: дата визита, время начала, процедура, имя мастера
select 
    s_d.work_date, 
    b.start_time, 
    p.procedure_name, 
    m.full_name as master_name
from bookings b
join schedule_days s_d on s_d.id = b.schedule_day_id
join procedures p on p.id = b.procedure_id
join users u on u.id = b.client_user_id
join users m on m.id = p.master_user_id
where 
    u.full_name = 'Мария'
    and 
    u.user_type = 'client'
    and 
    b.status = 'created'
    and 
    s_d.work_date >= date '2026-06-22';
    
-- 3. Плановая выручка и количество записей (status = 'created') по каждой категории. Нужны: название категории, количество броней, сумма.
select 
    p_c.category_name, 
    count(b.id) as count_booking,
    coalesce(sum(b.fixed_price),0) as total_sum
from procedure_categories p_c
left join procedures p 
    on p.category_id = p_c.id
left join bookings b 
    on b.procedure_id = p.id
    and b.status = 'created'
group by p_c.category_name;

-- 4. Информация об активных записях мастера на конкретную дату (например на 22.06.2026). Получить: название процедуры, дата визита, время начала и окончания визита, стимость на момент записи, имя и телефон клиента
select
    p.procedure_name,
    sd.work_date as date_visit,
    b.start_time as start_visit,
    b.end_time as end_visit,
    b.fixed_price as price,
    cl.full_name as client_name,
    cc.value
from bookings b
join procedures p on p.id = b.procedure_id
join schedule_days sd on sd.id = b.schedule_day_id
join users cl on cl.id = b.client_user_id
join users m on m.id = p.master_user_id
join contact_channels cc on cl.id = cc.user_id
where 
    sd.work_date = '2026-06-22'
    and 
    cl.user_type = 'client'
    and 
    b.status = 'created'
    and 
    cc.status = 'active';

-- 5. Активные каналы связи мастера. Получить: список активных каналов
select 
    u.full_name as master_name,
    ct.channel_name,
    cc.value as contact 
from users u
join contact_channels cc on cc.user_id = u.id
join channel_types ct on ct.id = cc.channel_type_id
where cc.status = 'active' and u.user_type = 'master';

-- 6. Получить все забронированные интервалы и перерывы на конкретную дату, например 25.06.2026 (для расчета свободных слотов на бэкенде)
select 'booked_slot' as type_slot, start_time, end_time
from bookings b
where schedule_day_id = (select id from schedule_days where is_working and work_date = '2026-06-25')
    and status = 'created'
union all
select 'unavailable_slot' as type_slot, start_time, end_time
from unavailable_periods
where schedule_day_id = (select id from schedule_days where is_working and work_date = '2026-06-25' );

-- 7. просмотр записи по access_token. Пример: access_token из ссылки клиента Полина
select  
    p.procedure_name, 
    cl.full_name as client_name, 
    m.full_name as master_name,
    b.fixed_price as price, 
    s_d.work_date as date_visit, 
    b.start_time as start_visit, 
    b.end_time as end_visit
from bookings b
join procedures p on p.id = b.procedure_id
join procedure_categories p_c on p_c.id = p.category_id
join users cl on cl.id = b.client_user_id
join users m on m.id = p.master_user_id
join schedule_days s_d on s_d.id = b.schedule_day_id
where b.access_token = 'booking-token-polina-011';

-- 8. Отмена записи клиентом по access_token или мастером по id записи. 
-- После отмены backend создаёт уведомление мастеру, если отмена по access_token и клиенту если по id

-- отмена клиентом
update bookings
set
    status = 'canceled',
    canceled_at = current_timestamp,
    updated_at = current_timestamp
where access_token = 'booking-token-polina-011'
  and status = 'created';

-- отмена записи мастером
update bookings
set
    status = 'canceled',
    canceled_at = current_timestamp,
    updated_at = current_timestamp
where id = 12
  and status = 'created';

-- 9. Статистика отмен записей. Получить название процедуры, кличество отмен и записей
 select 
    p.procedure_name,
    count(case when b.status = 'created' then 1 end) as count_created,
    count(case when b.status = 'canceled' then 1 end) as count_canceled
from bookings b
join procedures p on p.id = b.procedure_id
group by p.procedure_name
order by count_canceled desc;

-- 10. Уведомления, ожидающие отправки
select 
    u.full_name as recipient_name,
    u.user_type as recipient_type,
    n.notification_type, 
    n.message_text,
    n.status,
    n.created_at as date_time_created
from notifications n
join users u on u.id = n.recipient_user_id
where n.status = 'created'
order by date_time_created desc;

-- 11. Создание записи. Пример insert после проверок доступности слота на backend
insert into bookings (procedure_id, schedule_day_id, client_user_id, start_time, end_time, fixed_price, status, access_token, data_consent
) values
    (3, 6, 8, '15:00:00', '16:00:00', 2500.00, 'created', 'booking-token-irina-021', true);

-- 12. Топ-5 клиентов по сумме записей. Получить: имя, номер телефона и сумму по активным записям клиентов
select 
    u.full_name as client_name,
    cc.value as number_phone,
    coalesce(sum(b.fixed_price),0) as sum_bookings
from users u
join contact_channels cc on cc.user_id = u.id
join bookings b on b.client_user_id = u.id
where b.status = 'created' 
group by u.full_name, cc.value
order by sum_bookings desc
limit 5;