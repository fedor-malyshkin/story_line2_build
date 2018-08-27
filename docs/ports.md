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
- __9086__ - InfluxDB port (RPC)
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

# Hadoop: HDFS
- __50010 (http)__ - The datanode server address and port for data transfer (Internal, `dfs.datanode.address`)
- __50075 (http)__ - The datanode http server address and port.  (External, `dfs.datanode.http.address`)
- __50475 (https)__ - The datanode secure http server address and port. (Internal, `dfs.datanode.https.address`)
- __50020 (IPC)__ - The datanode ipc server address and port.  (Internal, `dfs.datanode.ipc.address`)
- __50070 (http)__ - The address and the base port where the dfs namenode web ui will listen on.   (External, `dfs.namenode.http-address`)
- __50470 (https)__ - The namenode secure http server address and port. (Internal, `dfs.namenode.https-address`)
- __9000 (IPC)__ - File system metadata operations (Internal, `fs.defaultFS`)

# Hadoop: YARN
- __8032 (IPC)__ - The address of the applications manager interface in the RM. (Internal, `yarn.resourcemanager.address`).
- __8030 (http)__ - The address of the scheduler interface.  (Internal, `yarn.resourcemanager.scheduler.address`)
- __8031 (http)__ - The secure http server address and port. (Internal, `yarn.resourcemanager.resource-tracker.address`)
- __8033 (http)__ - The address of the RM admin interface.  (Internal, `yarn.resourcemanager.admin.address`)
- __8088 (http)__- 	The http address of the RM web application. If only a host is provided as the value, the webapp will be served on a random port.    (Internal, `yarn.resourcemanager.webapp.address`) (Internal because of https://community.hortonworks.com/questions/191898/hdp-261-virus-crytalminer-drwho.html)
- __8090 (https)__ - The https address of the RM web application. If only a host is provided as the value, the webapp will be served on a random port.  (Internal, `yarn.resourcemanager.webapp.https.address`)
- __8040__ - Address where the localizer IPC is. (Internal, `yarn.nodemanager.localizer.address`)
- __8048 (IPC)__ - 	Address where the collector service IPC is. (Internal, `yarn.nodemanager.collector-service.address`)
- __8041 ???? (http)__ - 	The address of the container manager in the NM. (Internal, `yarn.nodemanager.address`)
- __8042 (http)__ - NM Webapp address (External, `yarn.nodemanager.webapp.address`)
- __8044 (https)__ - The https adddress of the NM web application.  (Internal, `yarn.nodemanager.webapp.https.address`)
- __13562 (http)__ - Default port that the ShuffleHandler will run on. ShuffleHandler is a service run at the NodeManager to facilitate transfers of intermediate Map outputs to requesting Reducers. (Internal, `mapreduce.shuffle.port`)

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
