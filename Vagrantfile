# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  # ubuntu/focal64
  # bento/ubuntu-20.04
  "server1testejr"   => {"memory" => "2048", "cpu" => "2", "ip" => "100", "image" => "ubuntu/focal64", 'provision' => 'install.sh'}
}

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.network "private_network", ip: "10.10.11.#{conf["ip"]}"
      # machine.vm.provision "shell", path: "./provision.sh"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/ansible-lab"]
      end
      # if "#{name}" == "manager"
      #   manager_ip == {conf["ip"]}
      #   machine.vm.provision "shell", 
      #     inline: <<-SHELL
      #       docker swarm init --advertise-addr #{conf["ip"]}
      #       docker swarm join-token -q worker > /vagrant/token
      #     SHELL
      # end
      if "#{name}" == "worker1"
        machine.vm.provision "shell", 
          inline: <<-SHELL
            docker swarm join --advertise-addr #{conf["ip"]} --listen-addr #{conf["ip"]}:2377 --token `cat /vagrant/token` #{manager_ip}:2377  
          SHELL
      end
      if "#{name}" == "server1testejr"
        machine.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub.usuario"
        machine.vm.provision 'shell', path: "ubuntu/#{conf['provision']}"
      end
      # if "#{name}" == "macosx" 
      #   machine.vm.synced_folder ".", "/vagrant",
      #     id: "core",
      #     :nfs => true,
      #     :mount_options => ['nolock,vers=3,udp,noatime,actimeo=1,resvport'],
      #     :export_options => ['async,insecure,no_subtree_check,no_acl,no_root_squash']
      # end
      # machine.vm.synced_folder ".", "/vagrant"


    end
  end
end
