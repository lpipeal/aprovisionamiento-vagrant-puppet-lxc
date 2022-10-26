# -*- mode: ruby -*-
# vi: set ft=ruby :


$install_puppet = <<-PUPPET
sudo apt-get update -y
sudo apt-get install -y puppet
PUPPET


Vagrant.configure("2") do |config|

  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote = true
  end

  config.vm.define :servidorUbuntu do |servidorUbuntu|
    servidorUbuntu.vm.box = "bento/ubuntu-20.04"
    servidorUbuntu.vm.hostname = "puppetServer"
    servidorUbuntu.vm.network :private_network, ip: "192.168.70.3"
    servidorUbuntu.vm.provision "shell", inline: $install_puppet
    servidorUbuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "puppet/modules"
    end
  end
end
