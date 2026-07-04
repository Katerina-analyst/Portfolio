# Матрица трассировки требований

## 1. Онлайн-запись клиента на процедуру

### FRQ-01. Просмотр и выбор категорий и процедур

| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-01.01`|`UC-01`|`BR-PROCEDURE-03`|`procedure_categories`|||||
|`FRQ-01.02`|`UC-01`|`BR-PROCEDURE-03`<br>`BR-BOOKING-09`|`procedure_categories`|||||
|`FRQ-01.03`|`UC-01`|—|`procedure_categories`<br>`procedures`|||||
|`FRQ-01.04`|`UC-01`|`BR-PROCEDURE-01`<br>`BR-PROCEDURE-02`|`procedures`|||||
|`FRQ-01.05`|`UC-01`|—|`procedures`|||||

### FRQ-02. Выбор даты и времени
| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-02.01`|`UC-01`|`BR-SCHEDULE-04`|`schedules`<br>`schedule_days`<br>`procedures`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.02`|`UC-01`|`BR-SCHEDULE-04`|`schedules`<br>`schedule_days`<br>`procedures`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.03`|`UC-01`|`BR-BOOKING-09`<br>`BR-SCHEDULE-04`|`schedule_days`||||
|`FRQ-02.04`|`UC-01`|`BR-SCHEDULE-03`<br>`BR-SCHEDULE-04`|`schedules`<br>`schedule_days`||||
|`FRQ-02.05`|`UC-01`|`BR-SCHEDULE-03`|`schedule_days`||||
|`FRQ-02.06`|`UC-01`|`BR-SLOT-01`–`BR-SLOT-04`|`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.07`|`UC-01`|`BR-SLOT-07`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.08`|`UC-01`|`BR-SLOT-05`|`procedures`||||
|`FRQ-02.09`|`UC-01`|`BR-SLOT-08`|`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.10`|`UC-01`|`BR-SLOT-06`|`procedures`||||
|`FRQ-02.11`|`UC-01`|`BR-SLOT-09`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.12`|`UC-01`|`BR-SLOT-02`<br>`BR-SLOT-07`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.13`|`UC-01`|`BR-SLOT-01`–`BR-SLOT-09`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.14`|`UC-01`|`BR-BOOKING-09`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.15`|`UC-01`|`BR-BOOKING-09`|`schedule_days`<br>`procedures`||||
|`FRQ-02.16`|`UC-01`|`BR-SLOT-02`–`BR-SLOT-04`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-02.17`|`UC-01`|`BR-SLOT-01`–`BR-SLOT-04`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||

### FRQ-03. Ввод контактных данных и согласия

| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-03.01`|`UC-01`|`BR-BOOKING-08`|`users`<br>`contact_channels`||||
|`FRQ-03.02`|`UC-01`|`BR-BOOKING-08`|`users`<br>`contact_channels`||||
|`FRQ-03.03`|`UC-01`|`BR-USER-01`|`users`||||
|`FRQ-03.04`|`UC-01`|`BR-BOOKING-08`<br>`BR-BOOKING-09`<br>`BR-BOOKING-10`|`procedures`<br>`schedule_days`<br>`users`<br>`contact_channels`||||
|`FRQ-03.05`|`UC-01`|`BR-BOOKING-08`|`users`<br>`contact_channels`||||
|`FRQ-03.06`|`UC-01`|`BR-BOOKING-10`|—||||
|`FRQ-03.07`|`UC-01`|`BR-BOOKING-10`|bookings|||
|`FRQ-03.08`|`UC-01`|`BR-BOOKING-08`<br>`BR-BOOKING-10`|—||||
|`FRQ-03.09`|`UC-01`|—|—||||

### FRQ-04. Подтверждение записи

| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-04.01`|`UC-01`|`BR-BOOKING-01`<br>`BR-BOOKING-08`–`BR-BOOKING-10`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`<br>`users`<br>`contact_channels`||||
|`FRQ-04.02`|`UC-01`|—|—||||
|`FRQ-04.03`|`UC-01`|—|—||||
|`FRQ-04.04`|`UC-01`|`BR-BOOKING-08`–`BR-BOOKING-10`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`||||
|`FRQ-04.05`|`UC-01`|`BR-BOOKING-08`–`BR-BOOKING-10`|—||||
|`FRQ-04.06`|`UC-01`|—|—||||

### FRQ-05. Создание записи
| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-05.01`|`UC-01`|`BR-BOOKING-01`|`bookings`<br>`users`<br>`contact_channels`<br>`procedures`<br>`schedule_days`||||
|`FRQ-05.02`|`UC-01`|—|`bookings`<br>`users`<br>`procedures`<br>`schedule_days`||||
|`FRQ-05.03`|`UC-01`|`BR-BOOKING-05`|`bookings`||||
|`FRQ-05.04`|`UC-01`|—|`bookings`||||
|`FRQ-05.05`|`UC-01`|`BR-BOOKING-05`<br>`BR-BOOKING-06`|`bookings`||||
|`FRQ-05.06`|`UC-01`<br>`UC-06`|`BR-NOTIFY-01`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`||||
|`FRQ-05.07`|`UC-01`|—|`bookings`||||
|`FRQ-05.08`|`UC-01`|`BR-BOOKING-07`|`procedures`<br>`bookings`||||

## 2. Авторизация мастера

### FRQ-06. Вход в личный кабинет мастера
| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-06.01`|`UC-02`|—|—|||||
|`FRQ-06.02`|`UC-02`|—|—|||||
|`FRQ-06.03`|`UC-02`|—|`users`|||||
|`FRQ-06.04`|`UC-02`|`BR-USER-06`|`users`|||||
|`FRQ-06.05`|`UC-02`|`BR-USER-06`|`users`|||||
|`FRQ-06.06`|`UC-02`|—|`users`|||||
|`FRQ-06.07`|`UC-02`|`BR-USER-08`<br>`BR-USER-09`|`users`|||||

## 3. Управление профилем мастера

### FRQ-07. Управление профилем мастера
| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-07.01`|`UC-08`|—|`Users`|||||
|`FRQ-07.02`|`UC-08`|`BR-CHANNEL-04`|`Channel_types`|||||
|`FRQ-07.03`|`UC-08`|`BR-CHANNEL-05`|`Channel_types`<br>`Contact_channels`|||||
|`FRQ-07.04`|`UC-08`|`BR-CHANNEL-05`|`Contact_channels`|||||
|`FRQ-07.05`|`UC-08`|`BR-CHANNEL-05`|`Contact_channels`|||||
|`FRQ-07.06`|`UC-08`|`BR-CHANNEL-07`|`Contact_channels`|||||

## 4. Управление процедурами

### FRQ-08. Управление процедурами

| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-08.01`|`UC-03`|—|`Procedures`<br>`Procedure_categories`<br>`Users`|||||
|`FRQ-08.02`|`UC-03`|`BR-PROCEDURE-05`|`Procedures`|||||
|`FRQ-08.03`|`UC-03`|`BR-PROCEDURE-03`<br>`BR-PROCEDURE-05`|`Procedures`<br>`Procedure_categories`|||||
|`FRQ-08.04`|`UC-01`<br>`UC-03`|`BR-PROCEDURE-01`|`Procedures`|||||
|`FRQ-08.05`|`UC-01`<br>`UC-03`|`BR-PROCEDURE-02`|`Procedures`|||||
|`FRQ-08.06`|`UC-03`|—|`Procedures`<br>`Procedure_categories`|||||
|`FRQ-08.07`|`UC-03`|`BR-PROCEDURE-04`|`Procedure_categories`|||||

## 5. Настройка расписания

### FRQ-09. Управление расписанием

| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-09.01`|`UC-04`|—|`Schedules`<br>`Schedule_days`|||||
|`FRQ-09.02`|`UC-04`|`BR-SCHEDULE-05`|`Schedules`|||||
|`FRQ-09.03`|`UC-04`|—|`Schedule_days`|||||
|`FRQ-09.04`|`UC-04`|`BR-SCHEDULE-01`|`Schedule_days`|||||
|`FRQ-09.05`|`UC-04`|`BR-SCHEDULE-02`|`Schedule_days`|||||
|`FRQ-09.06`|`UC-04`|`BR-SCHEDULE-06`|`Schedule_days`<br>`Unavailable_periods`|||||
|`FRQ-09.07`|`UC-04`|`BR-SCHEDULE-06`<br>`BR-SCHEDULE-07`|`Unavailable_periods`|||||
|`FRQ-09.08`|`UC-04`|`BR-SCHEDULE-06`|`Schedule_days`<br>`Unavailable_periods`|||||
|`FRQ-09.09`|`UC-04`|`BR-SCHEDULE-07`<br>`BR-SCHEDULE-08`|`Schedule_days`<br>`Unavailable_periods`<br>`Bookings`|||||
|`FRQ-09.10`|`UC-04`|—|`Unavailable_periods`|||||
|`FRQ-09.11`|`UC-01`<br>`UC-04`|`BR-SLOT-01`–`BR-SLOT-09`|`Schedule_days`<br>`Unavailable_periods`<br>`Bookings`<br>`Procedures`|||||

## 6. Управление записями мастером

### FRQ-10. Просмотр и отмена записей мастером

| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-10.01`|`UC-05`|—|`Bookings`<br>`Schedule_days`<br>`Procedures`|||||
|`FRQ-10.02`|`UC-05`|—|`Bookings`<br>`Schedule_days`|||||
|`FRQ-10.03`|`UC-05`|—|`Bookings`<br>`Procedures`<br>`Schedule_days`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-10.04`|`UC-05`|—|`Bookings`<br>`Procedures`<br>`Schedule_days`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-10.05`|`UC-05`|—|`Bookings`|||||
|`FRQ-10.06`|`UC-05`|`BR-CANCEL-01`|`Bookings`|||||
|`FRQ-10.07`|`UC-05`|—|`Bookings`|||||
|`FRQ-10.08`|`UC-05`<br>`UC-06`|`BR-NOTIFY-02`|`Bookings`<br>`Notifications`<br>`Users`<br>`Contact_channels`|||||

## 7. Уведомления

### FRQ-11. Создание и отправка уведомлений
| **Функциональное**<br>**требование** | **Use Case** | **Бизнес-правила** | **Сущности БД** | **Метод API** | **Sequence-диаграмма** | **Тест-кейсы**|
|---|---|---|---|---|---|---|
|`FRQ-11.01`|`UC-01`<br>`UC-06`|`BR-NOTIFY-01`|`Bookings`<br>`Notifications`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-11.02`|`UC-01`<br>`UC-06`|`BR-NOTIFY-01`|`Bookings`<br>`Notifications`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-11.03`|`UC-05`<br>`UC-06`|`BR-NOTIFY-02`|`Bookings`<br>`Notifications`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-11.04`|`UC-06`<br>`UC-07`|`BR-NOTIFY-03`|`Bookings`<br>`Notifications`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-11.05`|`UC-06`|`BR-NOTIFY-04`|`Bookings`<br>`Schedule_days`<br>`Notifications`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-11.06`|`UC-06`|`BR-NOTIFY-05`|`Notifications`|||||
|`FRQ-11.07`|`UC-06`|`BR-NOTIFY-01`–`BR-NOTIFY-04`|`Notifications`<br>`Users`<br>`Contact_channels`<br>`Channel_types`|||||
|`FRQ-11.08`|`UC-06`|`BR-NOTIFY-06`|`Notifications`|||||
|`FRQ-11.09`|`UC-06`|—|`Notifications`|||||
|`FRQ-11.10`|`UC-06`|—|`Notifications`|||||
|`FRQ-11.11`|`UC-06`|`BR-NOTIFY-07`|`Notifications`|||||
|`FRQ-11.12`|`UC-06`|`BR-NOTIFY-08`|`Bookings`<br>`Notifications`|||||

## 8. Отмена записи клиентом

### FRQ-12. Просмотр и отмена записи клиентом по ссылке
| Функциональное<br>требование| Use Case | Бизнес-правила | Сущности БД | Метод API | Sequence-диаграмма | Тест-кейсы |
|---|---|---|---|---|---|---|
|`FRQ-12.01`|`UC-07`|`BR-BOOKING-05`<br>`BR-BOOKING-06`|`Bookings`|||||
|`FRQ-12.02`|`UC-07`|`BR-BOOKING-06`|`Bookings`<br>`Procedures`<br>`Schedule_days`|||||
|`FRQ-12.03`|`UC-07`|`BR-BOOKING-06`<br>`BR-CANCEL-03`|`Bookings`<br>`Schedule_days`|||||
|`FRQ-12.04`|`UC-07`|`BR-CANCEL-01`|`Bookings`|||||
|`FRQ-12.05`|`UC-07`|—|`Bookings`|||||
|`FRQ-12.06`|`UC-06`<br>`UC-07`|`BR-NOTIFY-03`|`Bookings`<br>`Notifications`<br>`Users`<br>`Contact_channels`|||||
|`FRQ-12.07`|`UC-07`|`BR-CANCEL-03`|`Bookings`<br>`Schedule_days`|||||

## 9. Связь с мастером

### FRQ-13. Отображение каналов связи
| Функциональное<br>требование| Use Case | Бизнес-правила | Сущности БД | Метод API | Sequence-диаграмма | Тест-кейсы |
|---|---|---|---|---|---|---|
|`FRQ-13.01`|`UC-09`|`BR-CHANNEL-06`|`Users`<br>`Contact_channels`<br>`Channel_types`|||||
|`FRQ-13.02`|`UC-09`|—|`Contact_channels`<br>`Channel_types`|||||
|`FRQ-13.03`|`UC-09`|—|`Contact_channels`<br>`Channel_types`|||||
|`FRQ-13.04`|`UC-09`|—|`Contact_channels`<br>`Channel_types`|||||
|`FRQ-13.05`|`UC-09`|—|`Contact_channels`<br>`Channel_types`|||||