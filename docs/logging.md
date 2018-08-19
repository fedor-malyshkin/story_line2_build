---
title: Logging
layout: post
permlink: logging
---

# Library
Main library for java products is [SLF4J](https://www.slf4j.org).

Use in gradle like this
```
compile 'org.slf4j:slf4j-api:1.7.XXX'
compile 'ch.qos.logback:logback-classic:1.1.X'
```

# Main rules in logging
* Detailed output only in TRACE level (could be checked by "isTraceEnabled")
* Startup and shutdown - INFO
* On production INFO level for all components

---
{% include toc.md %}
