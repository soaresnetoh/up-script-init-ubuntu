#!/bin/bash

## Instalando Docker no  ubuntu 18.04.5 lts

sudo apt update 

sudo apt install -y apt-transport-https \
                    ca-certificates \
                    curl \
                    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  \
            $(lsb_release -cs)  stable" 

sudo apt-get update && sudo apt-get install -y docker-ce

sudo groupadd docker 2>&1 >/dev/null
sudo usermod -aG docker vagrant 2>&1 >/dev/null
sudo usermod -aG docker usuario 2>&1 >/dev/null

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

