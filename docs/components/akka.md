---
title: "Components: Akka"
layout: post
permalink: components/akka
---
**Description:** Actor-based solution for distributed processing of crawled from sites data. It reads data from Kafka stream, analyses it with groovy scripts, and stores result in HDFS and Elasticsearch cluster. For better performance it implemented with help of Akka Streams.

**Technologies:**  Implemented as Akka app. Also used: **Scala, Java 8, groovy, Kafka, Akka, Akka Streams, Akka Cluster, HDFS, Elastisearch, FP, TDD**.

**Git-repo:** [story_line2_server_akka](https://github.com/fedor-malyshkin/story_line2_server_akka)

**Provision script (Puppet manifest):** [server_akka.pp](https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_components/manifests/server_akka.pp)

**Additional info:**

[![Build Status](http://ci.nlp-project.ru:8080/buildStatus/icon?job=story_line2_server_akka)](http://ci.nlp-project.ru:8080/job/story_line2_server_akka/)

---
{% include toc.md %}
