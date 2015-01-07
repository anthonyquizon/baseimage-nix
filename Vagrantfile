# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.provider "docker" do |d|
        #d.cmd     = ["/sbin/my_init", "--enable-insecure-key"]
        d.image   = "phusion/baseimage"
        d.vagrant_vagrantfile = "./host/Vagrantfile"
        d.has_ssh = true
    end

    config.ssh.username = "root"
    config.ssh.private_key_path = "insecure_key"
end
