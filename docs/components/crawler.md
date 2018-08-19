---
title: "Components: Crawler"
layout: post
permalink: components/crawler
---
**Description:** News site spider (crawler)

**Technologies:** Implemented as microservice with one configuration file. Created with usage of [Spring](http://spring.io).

**Git-repo:** [story_line2_crawler](https://github.com/fedor-malyshkin/story_line2_crawler)

**Provision script (Puppet manifest):** [crawler.pp](https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_components/manifests/crawler.pp)

**Additional info:**

# Getting data
Because not all news site publish their content trough rss/atom-feeds there is a necessarity to parse their web pages directly. For getting pages (and walking through site structure) used crawler (edu.uci.ics:crawler4j).
After page was received it is analysed by groovy scripts (repo  [story_line2_crawler_scripts](https://github.com/fedor-malyshkin/story_line2_crawler_scripts)),
which not only detect possibility to extract content but also extract additional info
(publish date, link to picture and so on...)

# Configuration file
```
---
# Количество потоков на сайт (лучше не более 4)
crawler_per_site: 1
# Папка со скриптами для парсинга контента сайтов
crawler_script_dir: /tmp/crawler/scripts
# Каталог для сохранения данных о результатах парсинга сайта (для каждого сайта
# создается подпапка с именем домена для хранения соотвествующих данных)
crawler_storage_dir: /tmp/crawler
# строка подключения к MongoDB для сохранения результатаов анализа
mongodb_connection_url: mongodb://localhost:27017/
# Количество дней на которое должна быть более стара новость для того, что бы
# не загружать картинки
skip_images_older_days: 30

# Блок с настройками для анализируемых сайтов
parse_sites:
   # На каждый сайт. Название домена (будет использоваться для идентфикации и записи в БД)
 - source: bnkomi.ru
   # На каждый сайт. стартовая страница для парсинга
   seed: http://bnkomi.ru
   cron_schedule: "0 0/5 * * * ?" # Fire every 5 minutes

feed_sites:
   # На каждый сайт. Название домена (будет использоваться для идентфикации и записи в БД)
 - source: komiinform.ru
   # Для тех сайтов, что содержат в feed'е весь контент в данном параметре выставляется 'false'
   parse_for_content: false
   # Для тех сайтов, что содержат в feed'е изображение в данном параметре выставляется 'false'
   parse_for_image: false
   # На каждый сайт. стартовая страница для парсинга
   feed: http://komiinform.ru/rss/news/
   # Расписание в формате cron (http://www.quartz-scheduler.org/documentation/quartz-2.x/tutorials/crontrigger.html)
   cron_schedule: "0 0/5 * * * ?" # Fire every 5 minutes
```

# Metrics
```
influxdb_metrics:
   enabled: false
   influxdb_host: ""
   influxdb_port: 8086
   influxdb_db: ""
   influxdb_user: ""
   influxdb_password: ""
   reporting_period: 30
```   

# Writing to Kafka
Received info is serializes to JSON and is writtent to kafka broker (`crawler` topic)

Format:

```
{
    "_id" : "587cbc11aca9f3482120b052",
    "publication_date" : "2017-01-13T16:06:00.000Z", // datetime in UTC
	"processing_date" : "2017-01-13T16:06:00.000Z", // datetime in UTC
	"content" : "Около ... фактическим исполнением.",
    "raw_content" : "<html>....",  // только в случае невозможности предварительного извлечения данных....
    "path" : "/data/news/58212/",
    "source" : "bnkomi.ru",
    "title" : "Сыктывкарец ради отпуска за границей полностью погасил долг по кредиту",
    "image_url" : "bnkomi.ru/content/news/images/51898/6576-avtovaz-nameren-uvelichit-eksport-lada_mainPhoto.jpg",
    "url" : "https://www.bnkomi.ru/data/news/58212/"
}
```

# Data from feeds
If content was not received from rss/atom-feed all raw_content is wrtten in "raw_content". In this case fileds "publication_date", "title", "image_url" и "content" can absent in resulting JSON.

---
{% include toc.md %}
