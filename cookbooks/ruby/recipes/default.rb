#
# Cookbook Name:: myApp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


execute 'setRubyVersion' do
cwd '/opt'
command 'rvm use ruby-2.1.5'
end