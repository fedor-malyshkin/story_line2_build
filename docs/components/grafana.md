---
title: "Components: Grafana"
layout: post
permalink: components/grafana
---
**Description:** Grafana is unique open platform for analytics and monitoring.

**Provision script (Puppet manifest):** [grafana.pp](https://github.com/fedor-malyshkin/story_line2_deployment/blob/master/modules/storyline_infra/manifests/grafana.pp)

**Additional info:** [Grafana site](https://grafana.com/)

The most opaque thing in IT it's distributed system - you will not see what happens under hood until it's too late. Of course if you don't use some kind of monitoring and alarms - and I do...

Grafana can visualise data from a lot of sources (in my case it's only InfluxDB) and makes it perfectly!
Here is some examples from my project:
![grafana01]({{ "/assets/img/components/grafana/grafana01.jpg" | relative_url }})
![grafana02]({{ "/assets/img/components/grafana/grafana02.jpg" | relative_url }})
![grafana03]({{ "/assets/img/components/grafana/grafana03.jpg" | relative_url }})


Another important part of its functionality - it's ability to create alarms on some thresholds/events.

---
{% include toc.md %}
