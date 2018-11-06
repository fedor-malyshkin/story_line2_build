---
title: "Components: Kafka"
layout: post
permalink: components/kafka
---
**Description:** Kafka is one of the most important transport layer in project - almost every interconnection between services organized with Kafka.

**Provision script (Puppet manifest):** [kafka.pp](https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_infra/manifests/kafka.pp)

**Additional info:** [Kafka site](http://kafka.apache.org/)

To create Kafka cluster I have used 3 machines and Zookeeper ensemble - all states in Kafka broker are under monitoring
(see [Monitoring Links]({{ site.baseurl}}{% link monitoring_links.md %})). Of course it's necessary to monitore also producer
and consumer - but I will make it later. You can read some nterresting links about monitoring Kafka and collecting metrics with help of [jmxtrans](http://www.jmxtrans.org/) in those links:
* [Monitoring Apache Kafka with Grafana / InfluxDB via JMX](https://softwaremill.com/monitoring-apache-kafka-with-influxdb-grafana/)
* [How to Monitor Kafka](https://blog.serverdensity.com/how-to-monitor-kafka/)
* [Ready dashboadrds for Kafka and settings for jmxtrans](https://github.com/softwaremill/confluent-playground/tree/master/metrics/kafka)


**Hot commands:**

To manually create necessary topics you need to execute such commands:

```sh
bin/kafka-topics.sh --create --replication-factor 2 --partitions 2 --zookeeper localhost:2181 --topic crawler-events
bin/kafka-topics.sh --create --replication-factor 2 --partitions 2 --zookeeper localhost:2181 --topic crawler-commands
```

You always can see existing topics:

```sh
bin/kafka-topics.sh --list --zookeeper localhost:2181
```

---
{% include toc.md %}
