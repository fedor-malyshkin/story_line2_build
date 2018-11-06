---
title: "Components: InfluxDB"
layout: post
permalink: components/influxDB
---
**Description:** InfluxDB is time-series database intended for metric storage and fast querying of it.

**Provision script (Puppet manifest):** [influxdb.pp](https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_infra/manifests/influxdb.pp)

**Additional info:** [InfluxDB site](https://www.influxdata.com/time-series-platform/influxdb/)

The most opaque thing in IT it's distributed system - you will not see what happens under hood until it's too late. Of course if you don't use some kind of monitoring and alarms - and I do...

So I have been using InfluxDB in project from the beginning. It keeps records during a month and it's enough to monitor current state and make some investigations. With help of InfluxDB + Grafana I can easily watch what influence I made with my modifications on whole system.

---
{% include toc.md %}
