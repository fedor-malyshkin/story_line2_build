---
title: A little bit info about history of this project...
layout: post
---

When I thought about how to use in practice all technologies I studied last years - I have decided to create project which could include all my interests:

* a lot of data,
* distributed/cluster programming,
* ML,
* reactive/functional programming,
* network/REST programming,
* DevOps and so on....

The have choose idea of implementing a news aggregator and its server side for data collection, processing, storage and presentation. Not because I think that there is need to one other news aggregator - but because it's very easy to apply
aforementioned technologies.

From high-level point of view the project could be drawn like this:

![Project Infrastructure Schema]({{ "/assets/img/schema-intro.png" | relative_url }})

Project is divided in many parts (one for each component and other things) - which are available in [my repos](https://github.com/fedor-malyshkin/) with prefix **"story_line2_"**.

I have described all components of project (you can see them in TOC) with links to [repos](https://github.com/fedor-malyshkin/), CI status and deployment code.

Completed parts of project are working 24/7 - you can monitor its status in [Monitoring Links]({{ site.baseurl}}{% link monitoring_links.md %}).

If you have found any typo or have any questions - feel free to contact with me (contacts in footer).

---
{% include toc.md %}
