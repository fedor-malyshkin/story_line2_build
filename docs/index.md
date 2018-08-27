---
title: History and high-level project description
layout: post
---

When I thought about how to try use in practice all technologies I studied last years - I just decided to create project which could include all my interests:

* a lot of data,
* distributed/cluster programming,
* ML,
* reactive/functional programming,
* network/REST programming,
* DevOps and so on....

The idea of implementing a news aggregator (with a client on Android) and its server side for data collection, processing, storage and presentation was chosen.
It could give me a chance to use all technologies I wanted.

From high-level point of view the project could be drawn like this:

![Project Infrastructure Schema]({{ "/assets/img/schema-intro.png" | relative_url }})

Project divided in many parts (one for each component and other things) - which are available in [my repos](https://github.com/fedor-malyshkin/) with prefix "story_line2_".

Project is working 24/7 - you can monitor its status in [Monitoring Links]({{ site.baseurl}}{% link monitoring_links.md %}) (specially in Grafana, Spark UI, HDFS UI, YARN UI and Zeppelin/Jupither).

If you have found any typo or have any questions - feel free to contact with me (contacts in footer).


_Content isn't filled yet, But you can look at project description
here  [habr.com](https://habr.com/post/334510/)  (but only in Russian)_

---
{% include toc.md %}
