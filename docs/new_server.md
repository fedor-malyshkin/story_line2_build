---
title: "Adding new server"
layout: post
permalink: new_server
---

__NOTE:__ All these steps must be done with ```root``` privileges

1. [Access key] by SSH ON LOCAL machine generate new keys for server: `ssh-keygen -t rsa -b 4096 -C "srv_oper"`
1. Create swap-file (http://mydebianblog.blogspot.ru/2010/05/swap-swap-linux.html)
	1. dd if=/dev/zero of=/swapfile bs=1M count=5000
	1. mkswap /swapfile
	1. swapon /swapfile
	1. echo "/swapfile none swap sw 0 0" >> /etc/fstab
1. install git: `apt-get update && apt-get -y install git`
1. [Deploy key] generate key `ssh-keygen -t rsa -b 4096 -C "your_github_email_account@example.com"`
1. [Deploy key] Import public park of the key into guthub (in REPO Repository->Settings->Deploy Keys, don't forget give a meaningful name)
2. [Deploy key] add into /home/deploy-user-name/.ssh/config:
```
Host github.com
	Hostname github.com
	user git
	IdentitiesOnly yes
	IdentityFile ~/.ssh/id_rsa.deployment
```
2. [Deploy key] `chmod 600 ~/.ssh/config` !!!
1. [Deploy key] `chmod 700 ~/.ssh`
1. checkout `story_line2_deployment` dir by: `git clone github.com:fedor-malyshkin/story_line2_deployment.git provision`
1. change domain name:
	1. Add "hostname.nlp-project.ru" to `/etc/hostname`
	1. Add "11.22.33.44 hostname hostname.nlp-project.ru" to `/etc/hosts`
1. Set timezone: `sudo timedatectl set-timezone Europe/Moscow`
1. __Reboot__
1. Run `provision_production.sh`
1. [Access key] add public keys to to `/home/srv_oper/.ssh/authorized_keys` on REMOTE MACHINE
1. [Access key] Add entries to local SSH config (`/home/XXXX/.ssh/config`):
```
Host YYYYY
	Hostname 11.22.33.44
	user srv_oper
	IdentitiesOnly yes
	IdentityFile ~/.ssh/rsa.YYYYYY
```


---
{% include toc.md %}
