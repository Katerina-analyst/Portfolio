## 1. Трассировка функциональных требований

### 1.1. Онлайн-запись клиента на процедуру

#### FRQ-01. Просмотр и выбор категорий и процедур

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-01.01`|`UC-01`|`US-01`|Не применимо|`procedure_categories`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-01.02`|`UC-01`|`US-01`|`BR-BOOKING-08`|`procedure_categories`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-01.03`|`UC-01`|`US-01`|Не применимо|`procedure_categories`<br>`procedures`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-01.04`|`UC-01`|`US-01`|`BR-PROCEDURE-01`|`procedures`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-01.05`|`UC-01`|`US-02`|Не применимо|`procedures`|`INT-01`|`SQ-01`|Не применимо||

#### FRQ-02. Выбор даты и времени

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-02.01`|`UC-01`|`US-03`|`BR-SCHEDULE-03`|`schedules`<br>`schedule_days`<br>`procedures`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|`NFR-03.01`||
|`FRQ-02.02`|`UC-01`|`US-03`|`BR-SCHEDULE-03`|`schedules`<br>`schedule_days`<br>`procedures`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|`NFR-03.01`||
|`FRQ-02.03`|`UC-01`|`US-03`|`BR-SCHEDULE-03`|`schedule_days`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-02.04`|`UC-01`|`US-03`|`BR-SLOT-01`-`BR-SLOT-08`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|`NFR-03.02`||
|`FRQ-02.05`|`UC-01`|`US-03`|Не применимо|`schedule_days`<br>`procedures`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|`NFR-03.02`||
|`FRQ-02.06`|`UC-01`|`US-03`|Не применимо|`schedule_days`<br>`procedures`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-02.07`|`UC-01`|`US-03`|`BR-BOOKING-02`<br>`BR-SLOT-02`-`BR-SLOT-04`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|`NFR-05.03`||
|`FRQ-02.08`|`UC-01`|`US-03`|`BR-BOOKING-02`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|Не применимо||

#### FRQ-03. Ввод контактных данных и согласия

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-03.01`|`UC-01`|`US-05`|`BR-BOOKING-07`|Не применимо|`INT-01`|`SQ-01`|`NFR-10.03`||
|`FRQ-03.02`|`UC-01`|`US-05`|`BR-BOOKING-07`|Не применимо|`INT-01`|`SQ-01`|`NFR-10.03`||
|`FRQ-03.03`|`UC-01`|`US-05`|`BR-USER-01`|`users`|`INT-01`|`SQ-01`|`NFR-10.03`||
|`FRQ-03.04`|`UC-01`|`US-05`|`BR-BOOKING-07`<br>`BR-BOOKING-08`<br>`BR-BOOKING-09`|`procedures`<br>`schedule_days`<br>`users`<br>`contact_channels`<br>`bookings`|`INT-01`|`SQ-01`|`NFR-10.03`||
|`FRQ-03.05`|`UC-01`|`US-05`|`BR-BOOKING-07`|`users`|`INT-01`|`SQ-01`|`NFR-10.03`||
|`FRQ-03.06`|`UC-01`|`US-05`|Не применимо|`contact_channels`|`INT-01`|`SQ-01`|`NFR-07.04`<br>`NFR-10.03`||
|`FRQ-03.07`|`UC-01`|`US-05`|Не применимо|`users`<br>`contact_channels`|`INT-01`|`SQ-01`|`NFR-10.03`||
|`FRQ-03.08`|`UC-01`|`US-05`|`BR-BOOKING-07`|`contact_channels`<br>`bookings`|`INT-01`|`SQ-01`|`NFR-01.02`<br>`NFR-01.03`||
|`FRQ-03.09`|`UC-01`|Не применимо|`BR-BOOKING-09`|Не применимо|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-03.10`|`UC-01`|Не применимо|`BR-BOOKING-09`|`bookings`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-03.11`|`UC-01`|`US-05`|Не применимо|Не применимо|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-03.12`|`UC-01`|`US-05`|Не применимо|Не применимо|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-03.13`|`UC-01`|Не применимо|Не применимо|Не применимо|`INT-01`|`SQ-01`|Не применимо||

#### FRQ-04. Подтверждение записи

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-04.01`|`UC-01`|`US-04`|`BR-BOOKING-01`<br>`BR-BOOKING-07`-`BR-BOOKING-09`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`<br>`users`<br>`contact_channels`|`INT-01`|`SQ-01`|`NFR-03.03`||
|`FRQ-04.02`|`UC-01`|`US-04`|Не применимо|Не применимо|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-04.03`|`UC-01`|`US-04`|Не применимо|Не применимо|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-04.04`|`UC-01`|`US-04`|`BR-BOOKING-07`-`BR-BOOKING-09`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-04.05`|`UC-01`|`US-04`|`BR-BOOKING-07`-`BR-BOOKING-09`|Не применимо|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-04.06`|`UC-01`|`US-04`|Не применимо|Не применимо|`INT-01`|`SQ-01`|Не применимо||

#### FRQ-05. Создание записи

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-05.01`|`UC-01`|`US-06`|`BR-BOOKING-01`|`bookings`<br>`users`<br>`contact_channels`<br>`procedures`<br>`schedule_days`|`INT-01`|`SQ-01`|`NFR-03.03`<br>`NFR-04.02`<br>`NFR-05.01`<br>`NFR-05.03`<br>`NFR-06.01`<br>`NFR-06.04`<br>`NFR-07.01`||
|`FRQ-05.02`|`UC-01`|`US-06`|Не применимо|`bookings`<br>`users`<br>`procedures`<br>`schedule_days`|`INT-01`|`SQ-01`|`NFR-05.01`<br>`NFR-06.01`<br>`NFR-06.04`||
|`FRQ-05.03`|`UC-01`|`US-06`|`BR-BOOKING-04`|`bookings`|`INT-01`|`SQ-01`|`NFR-05.01`<br>`NFR-06.01`<br>`NFR-06.04`||
|`FRQ-05.04`|`UC-01`|`US-06`|Не применимо|`bookings`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-05.05`|`UC-01`|`US-06`|`BR-BOOKING-04`<br>`BR-BOOKING-05`|`bookings`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-05.06`|`UC-01`<br>`UC-06`|`US-06`|`BR-NOTIFY-01`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-05.07`|`UC-01`|`US-06`|Не применимо|`bookings`|`INT-01`|`SQ-01`|`NFR-01.02`<br>`NFR-01.03`<br>`NFR-07.02`||
|`FRQ-05.08`|`UC-01`|`US-06`|`BR-BOOKING-06`|`procedures`<br>`bookings`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-05.09`|`UC-01`|`US-06`|`BR-USER-03`|`users`<br>`contact_channels`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-05.10`|`UC-01`|`US-06`|`BR-USER-02`-`BR-USER-04`|`users`<br>`contact_channels`<br>`bookings`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-05.11`|`UC-01`|`US-06`|`BR-BOOKING-02`-`BR-BOOKING-03`<br>`BR-SLOT-02`-`BR-SLOT-04`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|Не применимо||
|`FRQ-05.12`|`UC-01`|`US-06`|`BR-BOOKING-02`-`BR-BOOKING-03`<br>`BR-SLOT-02`-`BR-SLOT-04`|`procedures`<br>`schedule_days`<br>`unavailable_periods`<br>`bookings`|`INT-01`|`SQ-01`|Не применимо||

### 1.2. Авторизация косметолога

#### FRQ-06. Авторизация косметолога

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-06.01`|`UC-02`|`US-08`|Не применимо|Не применимо|||Не применимо||
|`FRQ-06.02`|`UC-02`|`US-08`|Не применимо|Не применимо|||`NFR-09.01`<br>`NFR-09.02`||
|`FRQ-06.03`|`UC-02`|`US-08`|Не применимо|`users`|||`NFR-09.01`<br>`NFR-09.02`||
|`FRQ-06.04`|`UC-02`|`US-08`|`BR-USER-06`|`users`|||`NFR-08.04`<br>`NFR-08.06`<br>`NFR-08.07`<br>`NFR-08.08`<br>`NFR-09.01`<br>`NFR-09.02`||
|`FRQ-06.05`|`UC-02`|`US-08`|`BR-USER-06`|`users`|||`NFR-08.04`||
|`FRQ-06.06`|`UC-02`|`US-08`|Не применимо|`users`|||`NFR-01.02`<br>`NFR-01.03`<br>`NFR-07.01`<br>`NFR-08.03`||
|`FRQ-06.07`|`UC-02`|`US-08`|`BR-USER-08`|`users`|||Не применимо||
|`FRQ-06.08`|`UC-02`|`US-08`|Не применимо|Не применимо|||`NFR-08.02`||
|`FRQ-06.09`|`UC-02`|`US-08`|Не применимо|Не применимо|||`NFR-08.06`<br>`NFR-08.07`<br>`NFR-08.08`||
|`FRQ-06.10`|`UC-02`|`US-08`|Не применимо|Не применимо|||Не применимо||

### 1.3. Управление профилем косметолога

#### FRQ-07. Управление профилем косметолога

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-07.01`|Не применимо|`US-11`|Не применимо|`users`|||`NFR-08.01`<br>`NFR-08.05`||
|`FRQ-07.02`|Не применимо|`US-11`|`BR-CHANNEL-03`|`channel_types`|||Не применимо||
|`FRQ-07.03`|Не применимо|`US-11`|`BR-CHANNEL-04`|`channel_types`<br>`contact_channels`|||Не применимо||
|`FRQ-07.04`|Не применимо|`US-11`|`BR-CHANNEL-04`|`contact_channels`|||Не применимо||
|`FRQ-07.05`|Не применимо|`US-11`|`BR-CHANNEL-04`|`contact_channels`|||Не применимо||

### 1.4. Управление процедурами

#### FRQ-08. Управление процедурами

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-08.01`|`UC-03`|`US-09`|Не применимо|`procedures`<br>`procedure_categories`<br>`users`|||`NFR-08.01`<br>`NFR-08.05`||
|`FRQ-08.02`|`UC-03`|`US-09`|`BR-PROCEDURE-04`|`procedures`|||Не применимо||
|`FRQ-08.03`|`UC-03`|`US-09`|`BR-PROCEDURE-02`<br>`BR-PROCEDURE-04`|`procedures`<br>`procedure_categories`|||Не применимо||
|`FRQ-08.04`|`UC-01`<br>`UC-03`|`US-09`|`BR-PROCEDURE-01`|`procedures`|||Не применимо||
|`FRQ-08.05`|`UC-01`<br>`UC-03`|`US-09`|`BR-PROCEDURE-01`|`procedures`|||Не применимо||
|`FRQ-08.06`|`UC-03`|`US-09`|Не применимо|`procedures`<br>`procedure_categories`|||Не применимо||
|`FRQ-08.07`|`UC-03`|`US-09`|`BR-PROCEDURE-03`|`procedure_categories`|||Не применимо||

### 1.5. Настройка расписания

#### FRQ-09. Управление расписанием

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-09.01`|`UC-04`|`US-10`|Не применимо|`schedules`<br>`schedule_days`|||`NFR-06.01`<br>`NFR-08.01`<br>`NFR-08.05`||
|`FRQ-09.02`|`UC-04`|`US-10`|`BR-SCHEDULE-04`|`schedules`|||`NFR-06.01`||
|`FRQ-09.03`|`UC-04`|`US-10`|Не применимо|`schedule_days`|||`NFR-06.01`||
|`FRQ-09.04`|`UC-04`|`US-10`|`BR-SCHEDULE-01`|`schedule_days`|||`NFR-06.01`||
|`FRQ-09.05`|`UC-04`|`US-10`|`BR-SCHEDULE-02`|`schedule_days`|||`NFR-06.01`||
|`FRQ-09.06`|`UC-04`|`US-10`|`BR-SCHEDULE-05`|`schedule_days`<br>`unavailable_periods`|||`NFR-06.01`||
|`FRQ-09.07`|`UC-04`|`US-10`|`BR-SCHEDULE-05`<br>`BR-SCHEDULE-07`|`unavailable_periods`|||`NFR-06.01`||
|`FRQ-09.08`|`UC-04`|`US-10`|`BR-SCHEDULE-05`|`schedule_days`<br>`unavailable_periods`|||`NFR-06.01`||
|`FRQ-09.09`|`UC-04`|`US-10`|`BR-SCHEDULE-06`<br>`BR-SCHEDULE-07`|`schedule_days`<br>`unavailable_periods`<br>`bookings`|||`NFR-06.01`||
|`FRQ-09.10`|`UC-04`|`US-10`|Не применимо|`unavailable_periods`|||`NFR-06.01`||
|`FRQ-09.11`|`UC-01`<br>`UC-04`|`US-10`|`BR-SLOT-01`-`BR-SLOT-08`|`schedule_days`<br>`unavailable_periods`<br>`bookings`<br>`procedures`|||Не применимо||
|`FRQ-09.12`|`UC-04`|`US-10`|`BR-SCHEDULE-01`|`schedule_days`|||Не применимо||
|`FRQ-09.13`|`UC-04`|`US-10`|`BR-SCHEDULE-07`|`schedule_days`<br>`bookings`|||Не применимо||

### 1.6. Управление записями косметологом

#### FRQ-10. Просмотр и управление статусами записей косметологом

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-10.01`|`UC-05`|Не применимо|Не применимо|`bookings`<br>`schedule_days`<br>`procedures`|||`NFR-08.01`<br>`NFR-08.05`||
|`FRQ-10.02`|`UC-05`|Не применимо|Не применимо|`bookings`<br>`schedule_days`|||Не применимо||
|`FRQ-10.03`|`UC-05`|Не применимо|Не применимо|`bookings`<br>`procedures`<br>`schedule_days`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-10.04`|`UC-05`|Не применимо|Не применимо|`bookings`<br>`procedures`<br>`schedule_days`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-10.05`|`UC-05`|Не применимо|`BR-CANCEL-05`|`bookings`|||Не применимо||
|`FRQ-10.06`|`UC-05`|Не применимо|`BR-CANCEL-01`|`bookings`|||`NFR-04.02`<br>`NFR-05.02`<br>`NFR-07.01`||
|`FRQ-10.07`|`UC-05`|Не применимо|Не применимо|`bookings`|||Не применимо||
|`FRQ-10.08`|`UC-05`<br>`UC-06`|Не применимо|`BR-NOTIFY-02`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-10.09`|`UC-05`|Не применимо|Не применимо|Не применимо|||Не применимо||
|`FRQ-10.10`|`UC-05`|Не применимо|Не применимо|`bookings`|||Не применимо||
|`FRQ-10.11`|`UC-01`<br>`UC-05`|Не применимо|`BR-CANCEL-02`<br>`BR-SLOT-01`-`BR-SLOT-08`|`bookings`<br>`schedule_days`<br>`unavailable_periods`<br>`procedures`|||Не применимо||
|`FRQ-10.12`|`UC-05`|Не применимо|`BR-STATUS-01`|`bookings`<br>`schedule_days`|||Не применимо||
|`FRQ-10.13`|`UC-05`|Не применимо|`BR-STATUS-01`|`bookings`|||Не применимо||
|`FRQ-10.14`|`UC-05`|Не применимо|`BR-STATUS-02`<br>`BR-STATUS-03`|`bookings`|||Не применимо||
|`FRQ-10.15`|`UC-05`|Не применимо|`BR-STATUS-02`|`bookings`<br>`schedule_days`|||Не применимо||
|`FRQ-10.16`|`UC-05`|Не применимо|`BR-STATUS-03`|`bookings`|||Не применимо||
|`FRQ-10.17`|`UC-05`|Не применимо|Не применимо|Не применимо|||Не применимо||
|`FRQ-10.18`|`UC-05`|Не применимо|Не применимо|`bookings`|||Не применимо||
|`FRQ-10.19`|`UC-05`|Не применимо|Не применимо|`bookings`|||Не применимо||

### 1.7. Уведомления

#### FRQ-11. Создание и отправка уведомлений

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-11.01`|`UC-01`<br>`UC-06`|`US-06`|`BR-NOTIFY-01`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-11.02`|`UC-01`<br>`UC-06`|`US-06`|`BR-NOTIFY-01`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-11.03`|`UC-05`<br>`UC-06`|Не применимо|`BR-NOTIFY-02`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-11.04`|`UC-06`<br>`UC-07`|`US-12`|`BR-NOTIFY-03`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-11.05`|`UC-06`|Не применимо|`BR-NOTIFY-04`|`bookings`<br>`schedule_days`<br>`notifications`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-11.06`|`UC-06`|Не применимо|Не применимо|`notifications`|||Не применимо||
|`FRQ-11.07`|`UC-06`|Не применимо|`BR-NOTIFY-01`-`BR-NOTIFY-04`|`notifications`<br>`users`<br>`contact_channels`<br>`channel_types`|||Не применимо||
|`FRQ-11.08`|`UC-06`|Не применимо|Не применимо|`notifications`|||Не применимо||
|`FRQ-11.09`|`UC-06`|Не применимо|Не применимо|`notifications`|||Не применимо||
|`FRQ-11.10`|`UC-06`|Не применимо|Не применимо|`notifications`|||Не применимо||
|`FRQ-11.11`|`UC-06`|Не применимо|`BR-NOTIFY-05`|`notifications`|||`NFR-07.01`<br>`NFR-07.02`<br>`NFR-07.03`||
|`FRQ-11.12`|`UC-06`|Не применимо|`BR-NOTIFY-06`|`bookings`<br>`notifications`|||`NFR-04.02`||
|`FRQ-11.13`|`UC-06`|Не применимо|`BR-CHANNEL-01`<br>`BR-NOTIFY-01`-`BR-NOTIFY-04`|`notifications`<br>`users`<br>`contact_channels`<br>`channel_types`|||Не применимо||

### 1.8. Отмена записи клиентом

#### FRQ-12. Просмотр и отмена записи клиентом по ссылке

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-12.01`|`UC-07`|`US-12`|`BR-BOOKING-04`<br>`BR-BOOKING-05`|`bookings`|||`NFR-07.04`||
|`FRQ-12.02`|`UC-07`|`US-12`|`BR-BOOKING-05`|`bookings`<br>`procedures`<br>`schedule_days`|||Не применимо||
|`FRQ-12.03`|`UC-07`|`US-12`|`BR-BOOKING-05`<br>`BR-CANCEL-03`|`bookings`<br>`schedule_days`|||Не применимо||
|`FRQ-12.04`|`UC-07`|`US-12`|`BR-CANCEL-01`|`bookings`|||`NFR-04.02`<br>`NFR-05.02`<br>`NFR-07.01`||
|`FRQ-12.05`|`UC-07`|`US-12`|Не применимо|`bookings`|||Не применимо||
|`FRQ-12.06`|`UC-06`<br>`UC-07`|`US-12`|`BR-NOTIFY-03`|`bookings`<br>`notifications`<br>`users`<br>`contact_channels`|||Не применимо||
|`FRQ-12.07`|`UC-07`|`US-12`|`BR-CANCEL-03`|`bookings`<br>`schedule_days`|||Не применимо||
|`FRQ-12.08`|`UC-07`|`US-12`|Не применимо|Не применимо|||Не применимо||
|`FRQ-12.09`|`UC-07`|`US-12`|Не применимо|`bookings`|||Не применимо||
|`FRQ-12.10`|`UC-01`<br>`UC-07`|`US-12`|`BR-CANCEL-02`<br>`BR-SLOT-01`-`BR-SLOT-08`|`bookings`<br>`schedule_days`<br>`unavailable_periods`<br>`procedures`|||Не применимо||

### 1.9. Связь с косметологом

#### FRQ-13. Отображение каналов связи

|**Функциональное**<br>**требование**|**Use Case**|**User Story**|**Бизнес-правила**|**Сущности БД**|**Интеграционный**<br>**сценарий**|**Sequence-диаграмма**|**Нефункциональные**<br>**требования**|**Тест-кейсы**|
|---|---|---|---|---|---|---|---|---|
|`FRQ-13.01`|Не применимо|`US-07`|`BR-CHANNEL-05`|`users`<br>`contact_channels`<br>`channel_types`|||Не применимо||
|`FRQ-13.02`|Не применимо|`US-07`|Не применимо|`contact_channels`<br>`channel_types`|||Не применимо||
|`FRQ-13.03`|Не применимо|`US-07`|Не применимо|`contact_channels`<br>`channel_types`|||Не применимо||
|`FRQ-13.04`|Не применимо|`US-07`|Не применимо|`contact_channels`<br>`channel_types`|||Не применимо||
|`FRQ-13.05`|Не применимо|`US-07`|Не применимо|`contact_channels`<br>`channel_types`|||Не применимо||

## 2. Трассировка нефункциональных требований

|**Нефункциональное требование**|**Use Case**|**User Story**|**Функциональные требования**|**Бизнес-правила**|**Тест-кейсы**|
|---|---|---|---|---|---|
|`NFR-01.01`|`UC-01`<br>`UC-02`<br>`UC-03`<br>`UC-04`<br>`UC-05`<br>`UC-07`|Не применимо|Не применимо|Не применимо||
|`NFR-01.02`|Не применимо|Не применимо|`FRQ-03.08`<br>`FRQ-05.07`<br>`FRQ-06.06`<br>`FRQ-10.09`<br>`FRQ-12.08`|Не применимо||
|`NFR-01.03`|Не применимо|Не применимо|`FRQ-03.08`<br>`FRQ-05.07`<br>`FRQ-06.06`<br>`FRQ-10.09`<br>`FRQ-12.08`|Не применимо||
|`NFR-03.01`|`UC-01`|`US-03`|`FRQ-02.01`<br>`FRQ-02.02`|Не применимо||
|`NFR-03.02`|`UC-01`|`US-03`|`FRQ-02.04`<br>`FRQ-02.05`|`BR-SLOT-01`-`BR-SLOT-08`||
|`NFR-03.03`|`UC-01`|`US-04`<br>`US-06`|`FRQ-04.01`<br>`FRQ-05.01`|`BR-BOOKING-01`||
|`NFR-04.01`|`UC-01`|Не применимо|Не применимо|Не применимо||
|`NFR-04.02`|`UC-01`<br>`UC-05`<br>`UC-06`<br>`UC-07`|Не применимо|`FRQ-05.01`<br>`FRQ-10.06`<br>`FRQ-10.16`<br>`FRQ-11.12`<br>`FRQ-12.04`|`BR-NOTIFY-06`||
|`NFR-05.01`|`UC-01`|`US-06`|`FRQ-05.01`<br>`FRQ-05.02`<br>`FRQ-05.03`<br>`FRQ-05.08`<br>`FRQ-05.09`<br>`FRQ-05.10`|`BR-BOOKING-01`<br>`BR-BOOKING-04`<br>`BR-BOOKING-06`<br>`BR-USER-02`-`BR-USER-04`||
|`NFR-05.02`|`UC-05`<br>`UC-07`|`US-12`|`FRQ-10.06`<br>`FRQ-12.04`|`BR-CANCEL-01`||
|`NFR-05.03`|`UC-01`|`US-06`|`FRQ-02.07`<br>`FRQ-05.01`<br>`FRQ-05.11`<br>`FRQ-05.12`|`BR-BOOKING-02`<br>`BR-BOOKING-03`<br>`BR-SLOT-02`-`BR-SLOT-04`||
|`NFR-06.01`|Не применимо|Не применимо|`FRQ-05.01`<br>`FRQ-09.01`<br>`FRQ-10.06`<br>`FRQ-10.16`<br>`FRQ-12.04`|Не применимо||
|`NFR-06.02`|Не применимо|Не применимо|Не применимо|Не применимо||
|`NFR-06.03`|Не применимо|Не применимо|Не применимо|Не применимо||
|`NFR-06.04`|Не применимо|Не применимо|`FRQ-05.01`<br>`FRQ-09.01`<br>`FRQ-10.06`<br>`FRQ-10.16`<br>`FRQ-12.04`|Не применимо||
|`NFR-07.01`|Не применимо|Не применимо|`FRQ-05.01`<br>`FRQ-06.06`<br>`FRQ-10.06`<br>`FRQ-10.16`<br>`FRQ-11.11`<br>`FRQ-12.04`|`BR-NOTIFY-05`||
|`NFR-07.02`|Не применимо|Не применимо|`FRQ-05.07`<br>`FRQ-06.06`<br>`FRQ-10.09`<br>`FRQ-11.11`<br>`FRQ-12.08`|Не применимо||
|`NFR-07.03`|`UC-06`|Не применимо|`FRQ-11.11`|`BR-NOTIFY-05`||
|`NFR-07.04`|Не применимо|Не применимо|`FRQ-03.06`<br>`FRQ-06.04`<br>`FRQ-12.01`|`BR-BOOKING-04`<br>`BR-BOOKING-05`<br>`BR-USER-06`||
|`NFR-08.01`|`UC-02`<br>`UC-03`<br>`UC-04`<br>`UC-05`|`US-08`<br>`US-09`<br>`US-10`<br>`US-11`|`FRQ-07.01`<br>`FRQ-08.01`<br>`FRQ-09.01`<br>`FRQ-10.01`|`BR-USER-06`||
|`NFR-08.02`|`UC-02`|`US-08`|`FRQ-06.08`|Не применимо||
|`NFR-08.03`|`UC-02`|`US-08`|`FRQ-06.06`|Не применимо||
|`NFR-08.04`|`UC-02`|`US-08`|`FRQ-06.04`<br>`FRQ-06.05`|`BR-USER-06`||
|`NFR-08.05`|`UC-03`<br>`UC-04`<br>`UC-05`|`US-09`<br>`US-10`<br>`US-11`|`FRQ-07.01`<br>`FRQ-08.01`<br>`FRQ-09.01`<br>`FRQ-10.01`|`BR-USER-06`||
|`NFR-08.06`|`UC-01`<br>`UC-07`|Не применимо|`FRQ-01.01`<br>`FRQ-02.01`<br>`FRQ-12.01`|Не применимо||
|`NFR-08.07`|`UC-01`|`US-06`|`FRQ-05.01`|Не применимо||
|`NFR-08.08`|`UC-02`|`US-08`|`FRQ-06.04`<br>`FRQ-06.09`|Не применимо||
|`NFR-08.09`|`UC-02`|`US-08`|`FRQ-06.04`<br>`FRQ-06.09`|Не применимо||
|`NFR-08.10`|`UC-02`|`US-08`|`FRQ-06.04`<br>`FRQ-06.09`|Не применимо||
|`NFR-09.01`|`UC-02`|`US-08`|`FRQ-06.02`<br>`FRQ-06.03`<br>`FRQ-06.04`|Не применимо||
|`NFR-09.02`|`UC-02`|`US-08`|`FRQ-06.03`<br>`FRQ-06.04`|Не применимо||
|`NFR-10.01`|`UC-05`|Не применимо|`FRQ-10.03`<br>`FRQ-10.04`|`BR-USER-06`||
|`NFR-10.02`|`UC-01`<br>`UC-02`<br>`UC-07`|`US-05`<br>`US-08`<br>`US-12`|`FRQ-03.01`-`FRQ-03.08`<br>`FRQ-06.02`-`FRQ-06.05`<br>`FRQ-12.01`|Не применимо||
|`NFR-10.03`|`UC-01`|`US-05`|`FRQ-03.01`-`FRQ-03.08`<br>`FRQ-05.09`<br>`FRQ-05.10`|`BR-USER-02`-`BR-USER-04`||
|`NFR-11.01`|`UC-01`<br>`UC-07`|`US-01`-`US-07`<br>`US-12`|`FRQ-01.01`-`FRQ-05.12`<br>`FRQ-12.01`-`FRQ-13.05`|Не применимо||
|`NFR-11.02`|`UC-01`<br>`UC-07`|`US-01`-`US-07`<br>`US-12`|`FRQ-01.01`-`FRQ-05.12`<br>`FRQ-12.01`-`FRQ-13.05`|Не применимо||
|`NFR-11.03`|`UC-01`<br>`UC-07`|`US-01`-`US-07`<br>`US-12`|`FRQ-01.01`-`FRQ-05.12`<br>`FRQ-12.01`-`FRQ-13.05`|Не применимо||
|`NFR-11.04`|`UC-01`<br>`UC-02`<br>`UC-03`<br>`UC-04`<br>`UC-05`<br>`UC-07`|`US-01`-`US-12`|`FRQ-01.01`-`FRQ-10.19`<br>`FRQ-12.01`-`FRQ-13.05`|Не применимо||