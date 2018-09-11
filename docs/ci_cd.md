---
title: "Continuous Integration, Continuous Deployment"
layout: post
permalink: ci_cd
---

# Continuous Integration
As CI server I choose [Jenknins](http://jenkins.io/). Link to it is located in
[Monitoring Links]({{ site.baseurl}}{% link monitoring_links.md %}).

**CI pipeline configuration**: in each submodule special file
 ([`Jenkninsfile`](https://jenkins.io/doc/book/pipeline/jenkinsfile/)) is created,
which describes process of extraction and testing this submodule

**Access to repo**: for access to repo GitHub Deployment keys are used. Each key is named by schema:
`story_line2_build` -> `story_line2_build.github.com` with key `id_rsa.story_line2_build`.
Path to repo looks like: `story_line2_crawler.github.com:fedor-malyshkin/story_line2_crawler.git`

Useful script for key generation:

```shell
#!/bin/sh
for var in story_line2_crawler story_line2_build story_line2_deployment \
 story_line2_client-android story_line2_server_web story_line2_server_storm story_line2_morph \
 story_line2_config story_line2_glr_parser story_line2_analyser story_line2_glr_parser_debugger \
 story_line2_glr_parser_testing story_line2_token story_line2_geo story_line2_server_akka
do
    ssh-keygen -b 4096 -t rsa -N "" -C "your_github_email_account@example.com" -f id_rsa.$var
done
```

# Server CI configuration
To work correctly and get necessary code from github several steps must be done:
2. `apt-get update && apt-get -y install git`
2. generate necessary keys (see script above)
2. Import public part of the key into guthub (in REPO Repository->Settings->Deploy Keys, don't forget give a meaningful name)
2. add into /home/jenkins-user-name/.ssh/config:
```
Host REPO_NAME.github.com
    Hostname github.com
    user git
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa.<reponame>
```
2. `chmod 600 ~/.ssh/config` !!!
2. `chmod 700 ~/.ssh` !!!
2. Add GitHub as known host `ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts`)
2. Check: `ssh -T REPO_NAME.github.com`
2. Note: use usual git repo (not github) in form of `ssh://REPO_NAME.github.com/fedor-malyshkin/REPO_NAME`
2. Read [link 1](https://help.github.com/articles/connecting-to-github-with-ssh/)
2. Read [link 2](https://developer.github.com/guides/managing-deploy-keys/#managing-deploy-keys)

# Continuous Deployment. Production server configuration
On production server cron-running task makes:
 2. checks SHA1 remote repo `story_line2_deployment` with tag `latest` with current stored value - case of difference it calls `git pull` (and get new version of scripts, configs and so on...). After that it calls `puppet apply` (trough batch file "provision_production.sh").


---
 {% include toc.md %}
