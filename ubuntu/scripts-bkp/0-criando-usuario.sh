#!/bin/bash
### vars.sh ####
USER='usuario'
PASS='usuario01'
function addUsers {
#criando o usuário suporte
useradd -m -d "/home/${USER}" -p $(openssl passwd -1 ${PASS}) -s /bin/bash ${USER}

#config.vm.provision :shell, :inline => "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys", run: "always"
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys



#alterando a senha do usuario vagrant
sudo usermod -p $(openssl passwd -1 ${PASS}) vagrant

#alterando a senha do root
sudo usermod -p $(openssl passwd -1 ${PASS}) root
}

addUsers