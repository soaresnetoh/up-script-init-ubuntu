#!/bin/bash

PROVISION="/vagrant/ubuntu-jenkins/"
cd $PROVISION

docker build -t hernanisoares/myjenkins-blueocean1:1.1 ./scripts

docker network create jenkins

#--detach \
docker run --name jenkins-blueocean \
  --rm \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=unix:///var/run/docker.sock \
  --env DOCKER_CERT_PATH=/certs/client \
  --publish 80:8080 \
  --publish 50000:50000 \
  --volume $PROVISION/var/jenkins_home:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --volume $PROVISION/var/run/docker.sock:/var/run/docker.sock \
    hernanisoares/myjenkins-blueocean1:1.1