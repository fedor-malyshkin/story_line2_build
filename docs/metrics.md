# Метрики
## Источник хранения / представления данных
На текущий момент основным источником/хранилищ данных о метриках является InfluxDB с Grafana для анализа.

## Библиотки
Одним из способов отправки данных является line-протокол (с библиотекой `com.github.davidb:metrics-influxdb` для `io.dropwizard.metrics:metrics-core`)
Другим способом отправки данныйх в InfluxDB является [Logstash](https://www.elastic.co/guide/en/logstash/) (с парсингом журналов)

## Структура записей в БД InfluxDB
Структура записи для InfluxDB:
Тэги: host (имя хоста, полученное, например: `InetAddress.getLocalHost().getCanonicalHostName();`), service (например 'crawler', 'server_storm'), остальные - по усмотрению автора сервиса;
Название поля: любое, отражающее хранящиеся данные;
Значение: числовое (ествественно :)).

Нпример: наименовени - "processed_links", тэги - [scope=in_app]/[host=datahouse01.nlp-project.ru]/[service=crawler]/[source=bnkomi_ru]/[port=9090], значение = 235.
