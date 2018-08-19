---
title: "Stand/server provisioning (DevOps specific)"
layout: post
permalink: provisioning_devops
---

When I thought about code/script organization it was important to make provision solution which could afford:

* Use the same provision scripts for testing/development/production.
* Make stand provisioning on-fly without additional artifact preparations
* Use versioning (use specific versions on production stand, and development (sometimes SNAPSHOT) versions on development/stand environments)

# Main tools
- [gradle](http://gradle.org/) - main build tool
- [docker-compose](https://docs.docker.com/compose/) - for docker group deployment automation
- [docker](https://docs.docker.com/) - lightweight container for linux
- [puppet](https://puppet.com/) - provisioning tool

# About [deployment](https://github.com/fedor-malyshkin/story_line2_deployment) submodule structure
- "docker_template" - Docker templates
- "puppet_config" - puppet's config files to change in container and docker images
- "modules" - custom puppet modules for provisioning (infrastructure component, os-specific settings and so on)
- "production" - production-specific script, Puppet's Hiera databse and puppet's `sites.pp`
- "test" - test-specific script, Puppet's Hiera databse and puppet's `sites.pp`
- "development" - development-specific script, Puppet's Hiera databse and puppet's `sites.pp`
- "teststand" - test-specific script, Puppet's Hiera databse and puppet's `sites.pp`
- provision_development.sh - provision-batch file
- provision_production.sh - provision-batch file
- provision_test.sh - provision_production.sh
- provision_teststand.sh - provision_production.sh

# Versioning
All versions should be specified in puppet's config (on stand or production environment) in yaml `%{environment}/hieradata/version.yaml`, so you should edit necessary configs

# About stands
## General note
- there are several kinds of stands:
	* development - stand for development where all componenets should be run manually
	* test - stand for testing purposes
	* production - main production stand
- stand initialization is done with help of gradle tasks (from [store_line2_build](https://github.com/fedor-malyshkin/story_line2_build) repo "build_scripts/build-tasks.gradle")
- __!!!names of containers should be the same as names of projects/submodules__
- all services are running under control and monitoring [monit](https://mmonit.com) - it gives nice UI to see service status (see at [Monitoring Links]({{ site.baseurl}}{%link monitoring_links.md %}))

## About "test"/"development"
- stand preparation is done with help of `gradle prepareStand` (creates necessary files but doesn't run anything)
- real run is done with help of docker/docker-compose, so it must be done under `root` account

Sreparation steps:
1. Stand type detected (development by default) but could be changed with help of additional parameter, `gradle -Pstand_type=test`)
1. Configuration file `story_line2_build/docker-%{environment}.properties` is read
1. Directory for data, logs and stand dir is created
1. Docker templates from "docker_templates"  are copied with substitution from  `story_line2_build/docker-%{environment}.properties`
1. if version of component used "presented" completed artifact is copied to dir `{docker_cont}/artifacts`

Running steps (under root)
1. in stand dir docker-compose (`docker-compose.yml`), is ran (docker 'ENTRYPOINT') - a lot of different bash scripts could be used for it

---
{% include toc.md %}
