#
# Cookbook Name:: wordpress_db
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


include_recipe 'mysql2_chef_gem'
include_recipe 'mysql::server'

mysql_secret = Chef::EncryptedDataBagItem.load_secret("/vagrant/.chef/encrypted_data_bag_secret")
mysql_creds = Chef::EncryptedDataBagItem.load("mysql", "passwords", mysql_secret)

mysql_connection_info = {
  :host => 'localhost',
  :username => 'root',
  :password => mysql_creds['root']
}

mysql_database node['wordpress']['db']['database'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['wordpress']['db']['user'] do
  connection mysql_connection_info
  password mysql_creds["#{node['wordpress']['db']['user']}"]
  action :create
end

%W{ % localhost }.each do |h|
  mysql_database_user node['wordpress']['db']['user'] do
    connection mysql_connection_info
    password mysql_creds["#{node['wordpress']['db']['user']}"]
    database_name node['wordpress']['db']['database']
    host h
    privileges [:all]
    action :grant
  end
end