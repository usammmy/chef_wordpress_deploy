#
# Cookbook Name:: wordpress_app
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'wordpress_app::default' do

  context 'Configures Wordpress application server when all attributes are default' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new do |node|
      	node.set['wordpress']['db']['host'] = 'localhost'
      	node.set['wordpress']['db']['name'] = 'foo'
      	node.set['wordpress']['db']['user'] = 'happy_user',
      	node.set['wordpress']['db']['pass'] = 'top_secret'
      end.converge(described_recipe)
    end

    before do
      stub_command("/usr/sbin/apache2 -t").and_return(true)
  	end

    it 'installs mysql2 gem' do
      expect(chef_run).to include_recipe 'mysql2_chef_gem'
    end

    it 'installs mysql packages' do
      expect(chef_run).to include_recipe 'mysql::client'
      expect(chef_run).to include_recipe 'mysql::server'
    end

    it 'configures wordpress application' do
      expect(chef_run).to include_recipe 'wordpress'
    end

  end
end
