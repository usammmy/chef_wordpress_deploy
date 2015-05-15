#
# Cookbook Name:: wordpress_app
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# ::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

# db_node = search(:node,"role:database-server").first

# node.set['wordpress']['db']['host'] = db_node.fqdn
# node.set['wordpress']['db']['user'] = db_node.wordpress.db.user
# node.set['wordpress']['db']['database'] = db_node.wordpress.db.database
# node.set['wordpress']['db']['password'] = db_node.wordpress.db.password


include_recipe 'mysql2_chef_gem'
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "wordpress"
