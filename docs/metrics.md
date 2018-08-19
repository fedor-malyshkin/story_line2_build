---
title: Metrics
layout: post
permlink: metrics
---

# Sources / Visualization
At the moment all metric are collected in InfluxDB with Grafana as main visualization tool. See in [Monitoring Links](/monitoring_links)

# Libraries
Main library for metric collection in java projects is `io.dropwizard.metrics:metrics-core` (with help of `com.github.davidb:metrics-influxdb`)

# Records structure in InfluxDB

Tags: host (host name: `InetAddress.getLocalHost().getCanonicalHostName();`), service (for example 'crawler', 'server_storm'), rest - by submodule author;
Fileds: any meaningful;
values: numeric (of course :)).

Sample: - `processed_links`, tags - `[scope=in_app]/[host=datahouse01.nlp-project.ru]/[service=crawler]/[source=bnkomi_ru]/[port=9090]`, value = 235.


---
{% include toc.md %}
