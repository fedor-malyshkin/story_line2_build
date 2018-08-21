---
title: "Used ports"
layout: post
permalink: ports
---

# Base services
- __222__ - ssh
- __3000__ - monit

# Monitoring
- __25826__ - _collectd port (deprectated)_
- __8086__ - InfluxDB port
- __8088__ - InfluxDB port (RPC)
- __8081__ - Grafana
- __8080__ - Jenkins

# Infrastructure
- __2181__ - zookeeper
- __2888__ - zookeeper (election)
- __3888__ - zookeeper (election)
- __8000__ - Ngnix
- __9200__ - elasticsearch
- __9092__ - kafka (plaintext)
- __27017__ - MongoDB

# Project's services
- __8001__ - __server_web__ application port
- __8002__ - __server_web__ admin port
- __8088__ - __crawler__ application port
- __8089__ - __crawler__ admin port

# Spark cluster
- __7077__ - Spark Master port
- __7078__ - Spark Worker port
- __8090__ - Spark Master UI port
- __8091__ - Spark Worker UI port

# Debugging
- __60000__ - java app debug port
- __50000__ - jmx java app monitoring port

# Deprecated
- __8082__ - Storm UI port (deprectated)
- __6627__ - Storm Numbus port (deprectated)
- __8083__ - Storm logviewer port (deprectated)
- __6700__, __6701__, __6702__, __6703__ - Storm supervisor ports (deprectated)
- __3772__ - Storm DRPC drpc.port (External DRPC Clients)  (deprectated)
- __3773__ - Storm DRPC drpc.invocations.port  (Worker Processes)  (deprectated)
- __3774__ - Storm DRPC drpc.http.port (External HTTP DRPC Clients) (deprectated)
- __9000__ - Ngnix based topology storage port ()

---
 {% include toc.md %}
