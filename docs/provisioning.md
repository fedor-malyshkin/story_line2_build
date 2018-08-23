---
title: "Development stand provisioning"
layout: post
permalink: provisioning
---

1. install necessary software, mentioned in [Prerequisites]({{ site.baseurl}}{%link prerequisites.md %})
1. checkout of story_line2_build repo with all submodules somewhere on machine
1. edit options (`deploy_dir`, `data_dir`, and `logs_dir`) in `docker-development.properties` in repo root directory
1. run `./gradlew prepareStand`
1. go to the directory from `deploy_dir` options
1. run `./docker_up_clean.sh` from that dir
1. wait for some period of time
1. ....
1. All ports from `docker-development.properties` are working and ready for work

---
{% include toc.md %}
