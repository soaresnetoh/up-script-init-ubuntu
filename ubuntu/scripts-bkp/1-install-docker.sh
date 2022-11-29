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

sudo groupadd docker | true 
sudo usermod -aG docker vagrant  || true
sudo usermod -aG docker usuario || true 

