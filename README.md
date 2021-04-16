# Root repo for project "story_line2"
Full description (and link to other submodules) could be found in [main project page](https://fedor-malyshkin.github.io/story_line2_build/)

# Disclaimer
Because I don't have enough time for this project anymore (and I've cancelled my hosting subscription)  - most of the links to services are dead. However, I decided to keep this repo and simply don't publish links to it.

I'm a little bit ashamed for some code in it :((( 

How many projects have suffered this fate!!.... 

## Local testing (with Docker)

* Start docker (in this directory):

```shell
# initial
docker run -it -v `pwd`:/mnt -p 80:4000 --name jekyll-story-line ubuntu bash 
# start
docker start jekyll-story-line 
# login
docker exec -it  jekyll-story-line bash
```

* (in docker) Install Ruby:

```shell
apt-get update
apt-get install -y locales ruby-full build-essential zlib1g-dev python2 libffi-dev  libssl-dev libreadline-dev
dpkg-reconfigure locales (select en_US.UTF-8 UTF-8, was 159)
update-locale LANG=en_US.UTF-8 
export  LANG=en_US.UTF-8 
````

* (in docker) Adjust Gem storage:

```shell
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

* (in docker) Finally, install Jekyll (https://jekyllrb.com/):

```shell
cd /mnt/docs
gem install jekyll bundler 
```

* (in docker) Run Jekyll (will be available on port 80):

```shell
update-locale LANG=en_US.UTF-8 
export  LANG=en_US.UTF-8 
cd /mnt/docs
bundle exec jekyll serve  --host 0.0.0.0
```

* (in docker) Update libs from time to time (must be run in site's directory):

```shell
apt-get -y update
apt-get -y  upgrade
apt-get -y  dist-upgrade
apt-get autoclean
apt-get autoremove
apt-get check
apt-get -f install
apt-get clean
apt-get autoclean
cd /mnt/docs
gem update
bundle install
bundle update
```

