---
title: Metrics
layout: post
permalink: metrics
---

# Sources / Visualization
At the moment all metric are collected in InfluxDB with Grafana as main visualization tool. See in [Monitoring Links]({{ site.baseurl}}{% link monitoring_links.md  %})

# Libraries
Main library for metric collection in java projects is `io.dropwizard.metrics:metrics-core` (with help of `com.github.davidb:metrics-influxdb`)

# Records structure in InfluxDB

Tags: host (host name: `InetAddress.getLocalHost().getCanonicalHostName();`), service (for example 'crawler', 'server_storm'), rest - by submodule author;
Fileds: any meaningful;
values: numeric (of course :)).

Sample: - `processed_links`, tags - `[scope=in_app]/[host=datahouse01.nlp-project.ru]/[service=crawler]/[source=bnkomi_ru]/[port=9090]`, value = 235.

# InfluxDB

Some steps must be done by hands on influxdb server:
- apt install influxdb-client
- restart without authentication option (https://docs.influxdata.com/influxdb/v1.6/administration/authentication_and_authorization/)
- `CREATE USER admin WITH PASSWORD '<password>' WITH ALL PRIVILEGES`
- restart with authentication option (https://docs.influxdata.com/influxdb/v1.6/administration/authentication_and_authorization/)
- execute such commands:
```
 CREATE DATABASE telegraf WITH DURATION 4w
 CREATE DATABASE story_line2 WITH DURATION 4w
 CREATE DATABASE crawler WITH DURATION 4w
 CREATE USER "grafana" WITH PASSWORD 'grafana'
 GRANT READ ON "telegraf" TO "grafana"
 GRANT READ ON "story_line2" TO "grafana"
 GRANT READ ON "crawler" TO "grafana"
 CREATE USER "telegraf" WITH PASSWORD 'telegraf'
 GRANT WRITE ON "telegraf" TO "telegraf"
 CREATE USER "crawler" WITH PASSWORD 'crawler'
 GRANT WRITE ON "crawler" TO "crawler"
```

---
{% include toc.md %}
