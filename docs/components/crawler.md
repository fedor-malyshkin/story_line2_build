---
title: "Components: Crawler"
layout: post
permalink: components/crawler
---
**Description:** News site spider (crawler)

**Technologies:** Implemented as microservice with one configuration file. Created with usage of [Spring](http://spring.io). Also used: **Java, Java 8, groovy, Kafka, Spring, Spring Boot, TDD**.

**Git-repo:** [story_line2_crawler](https://github.com/fedor-malyshkin/story_line2_crawler)

**Provision script (Puppet manifest):** [crawler.pp](https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_components/manifests/crawler.pp)

**Additional info:**

[![Build Status](http://ci.nlp-project.ru:8080/buildStatus/icon?job=story_line2_crawler)](http://ci.nlp-project.ru:8080/job/story_line2_crawler/)

# Getting data
Because not all news site publish their content trough rss/atom-feeds there is a necessarity to parse their web pages directly. For getting pages (and walking through site structure) used crawler (edu.uci.ics:crawler4j).
After page was received it is analysed by groovy scripts (repo  [story_line2_crawler_scripts](https://github.com/fedor-malyshkin/story_line2_crawler_scripts)),
which not only detect possibility to extract content but also extract additional info
(publish date, link to picture and so on...)

# Configuration file
```
crawler_per_site: 1
crawler_script_dir: /tmp/crawler/scripts
crawler_storage_dir: /tmp/crawler
kafka_connection_url: localhost:9092
skip_images_older_days: 30

parse_sites:
 - source: bnkomi.ru
   seed: http://bnkomi.ru
   cron_schedule: "0 0/5 * * * ?" # Fire every 5 minutes

feed_sites:
 - source: komiinform.ru
   parse_for_content: false
   parse_for_image: false
   feed: http://komiinform.ru/rss/news/
   cron_schedule: "0 0/5 * * * ?" # Fire every 5 minutes

# Metrics
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
Received info is serializes to JSON and is written to kafka broker (`crawler` topic)

Format:

```
{
  "event-type": "page-crawled-event",
  "event-data": {
    "publication_date": null,
    "path": "/data/news/60691/",
    "source": "bnkomi.ru",
    "title": null,
    "url": "https://www.bnkomi.ru/data/news/60691/",
    "image_url": null,
    "raw_content": "some",
    "raw_content_size": 4
  }
}
```

# Data from feeds
If content was not received from rss/atom-feed all raw_content is wrtten in "raw_content". In this case fileds "publication_date", "title", "image_url" и "content" can absent in resulting JSON.

---
{% include toc.md %}
