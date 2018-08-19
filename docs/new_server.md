---
title: "Adding new server"
layout: post
permlink: new_server
---

---

__Must be done with ```root``` priveleges__

1. by SSH generate new keys for me `ssh-keygen -t rsa -b 4096 -C "your_account@example.com"`
1. add public keys to to `/home/ХХХХХ/.ssh/authorized_keys`
1. Create swap-file (http://mydebianblog.blogspot.ru/2010/05/swap-swap-linux.html)
	1. dd if=/dev/zero of=/swapfile bs=1M count=5000
	1. mkswap /swapfile
	1. swapon /swapfile
	1. echo "/swapfile none swap sw 0 0" >> /etc/fstab


---
{% include toc.md %}
