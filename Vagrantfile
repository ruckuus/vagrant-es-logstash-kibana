# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$post = <<SCRIPT
echo "Finishing ..."
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "elasticsearch", primary: true do |elasticsearch|
    elasticsearch.vm.hostname = "es.deploylah.com"
    elasticsearch.vm.box = "hashicorp/precise64"
    elasticsearch.vm.network "forwarded_port", guest: 9300, host:9300 
    elasticsearch.vm.network "forwarded_port", guest: 9200, host:9200 
    elasticsearch.vm.network "private_network", ip: "192.168.254.2"
    elasticsearch.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/node/elasticsearch.pp"
    end
  end

  config.vm.define "front_end", primary: true do |front_end|
    front_end.vm.hostname = "front1.deploylah.com"
    front_end.vm.box = "hashicorp/precise64"
    front_end.vm.network "forwarded_port", guest: 80, host:8505 
    front_end.vm.network "private_network", ip: "192.168.254.3"
    front_end.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/node/front_end.pp"
    end
  end

  config.vm.define "back_end", primary: true do |back_end|
    back_end.vm.hostname = "backend.deploylah.com"
    back_end.vm.box = "hashicorp/precise64"
    back_end.vm.network "forwarded_port", guest:80, host:8506 
    back_end.vm.network "private_network", ip: "192.168.254.4"
    back_end.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/node/back_end.pp"
    end
  end

  config.vm.define "kibana", primary: true do |kibana|
    kibana.vm.hostname = "kibana.deploylah.com"
    kibana.vm.box = "hashicorp/precise64"
    kibana.vm.network "forwarded_port", guest:80, host:8507 
    kibana.vm.network "private_network", ip: "192.168.254.5"
    kibana.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file = "manifests/node/kibana.pp"
    end
  end

end

