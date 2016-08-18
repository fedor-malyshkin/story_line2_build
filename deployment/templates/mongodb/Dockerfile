# Format: FROM    repository[:version]
FROM       ubuntu:latest
# Format: MAINTAINER Name <email@addr.ess>
MAINTAINER Fedor Malyshkin <fedor.malyshkin@yandex.ru>

WORKDIR /mongodb
# Installation:
# Update apt-get sources AND install MongoDB
RUN apt-get update && apt-get install -y mongodb puppet

# Prepare by Puppet
COPY mongodb.pp .
RUN puppet apply mongodb.pp

VOLUME ['/data/db']
VOLUME ['/data/logs']

# Expose port ${mongodb_port} from the container to the host
EXPOSE ${mongodb_port}

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod", "--logpath=/data/logs/mongodb.log"]
