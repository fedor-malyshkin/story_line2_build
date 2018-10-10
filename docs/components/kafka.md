---
title: "Components: Kafka (Under construction)"
layout: post
permalink: components/kafka
---
**Description:** Kafak is one of the most important transport layer in project - almost every interconnection between services organized with Kafka.

**Provision script (Puppet manifest):** https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_infra/manifests/kafka.pp

**Additional info:** [Kafka site](http://kafka.apache.org/)

To manually create necessary topics -  you need to execute such commands:

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
