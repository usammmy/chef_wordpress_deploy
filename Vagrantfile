# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chef'
require 'chef/config'
require 'chef/knife'
current_dir = File.dirname(__FILE__)
Chef::Config.from_file(File.join(current_dir, '.chef', 'knife.rb'))

list_of_servers = {
  :app01 => {
    :hostname => "app01_server",
    :ipaddress => "10.10.20.11",
    :run_list => "role[base],role[application-server]"
  },
  :app02 => {
    :hostname => "app02_server",
    :ipaddress => "10.10.20.12",
    :run_list => "role[base],role[application-server]"
  },
  :app03 => {
    :hostname => "app03_server",
    :ipaddress => "10.10.20.13",
    :run_list => "role[base],role[application-server]"
  },
  :db01 => {
    :hostname => "db01_server",
    :ipaddress => "10.10.10.11",
    :run_list => "role[base],role[database-server]"
  },
  :db02 => {
    :hostname => "db02_server",
    :ipaddress => "10.10.10.12",
    :run_list => "role[base],role[database-server]"
  },
  :db03 => {
    :hostname => "db03_server",
    :ipaddress => "10.10.10.13",
    :run_list => "role[base],role[database-server]"
  },
  :app_proxy01 => {
    :hostname => "app_proxy01_server",
    :ipaddress => "10.10.30.11",
    :run_list => "role[base],role[proxy-app-server]"
  },
  :db_proxy01 => {
    :hostname => "db_proxy01_server",
    :ipaddress => "10.10.40.11",
    :run_list => "role[base]"
  }
}

Vagrant.configure("2") do |config|
  
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.omnibus.chef_version = :latest

  list_of_servers.each_pair do |name, options|
  
    config.vm.define name do |server|
      server.vm.box  = name.to_s
      server.vm.network :private_network, ip: options[:ipaddress]
      server.vm.network :forwarded_port, guest: 80, host: 8080 if name.match(/app_proxy01/)
      
      server.vm.provision :chef_client do |chef|
        chef.chef_server_url = "https://api.opscode.com/organizations/usammmy"
        chef.validation_key_path = "#{current_dir}/.chef/#{Chef::Config[:validation_client_name]}.pem"
        chef.validation_client_name = Chef::Config[:validation_client_name]
        
        chef.node_name = name.to_s
        chef.run_list = [options[:run_list].split(",")].flatten
        chef.delete_node = true
        chef.delete_client = true
      end
    
    end
  
  end
end
