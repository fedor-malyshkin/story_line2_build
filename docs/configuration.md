---
title: Configuration
layout: post
permalink: configuration
---

# Configuration of custom code
For java java submodule configuration library "config" is used (package `ru.nlp_project.story_line2.config`, repo [story_line2_config](https://github.com/fedor-malyshkin/story_line2_config)).

In case of [Spring](https://spring.io/) usage - its own ways for configuration file parsing (mainly by annotation `@ConfigurationProperties(ignoreUnknownFields = false, prefix = "config")`)


# Configuration of 3rd party project's components
Configuration process is described in [Provisioning (DevOps specific)]({{ site.baseurl}}{% link provisioning_devops.md %}) and [Provisioning]({{ site.baseurl}}{% link provisioning.md %}).

---
{% include toc.md %}
