---
title: "Components: Hadoop's HDFS"
layout: post
permalink: components/hadoop_hdfs
---
**Description:** One of the most important part of Hadoop technologies stack - distributed filesystem. Used as main storage for processed data and as source for different ML task.
All files are located in specified hierarchy:

`ROOT` -> `source` -> `date (in format "YYYY-mm-dd")` -> `files in Avro format`. Name of files formed as SHA1 for their "path" attribute.

**Provision script (Puppet manifest):** [hadoop.pp](https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_infra/manifests/hadoop.pp)

**Additional info:** [Hadoop site](http://hadoop.apache.org/)

---
{% include toc.md %}
