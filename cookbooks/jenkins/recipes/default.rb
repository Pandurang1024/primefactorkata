# Encoding: utf-8
#
# Cookbook Name:: jenkinsstack
# Recipe:: default
#
# Copyright 2014, Rackspace
#
# Gracefully handle the failure for an invalid installation type

begin
  include_recipe "jenkins::_master_#{node['jenkins']['master']['install_method']}"
rescue Chef::Exceptions::RecipeNotFound
  raise Chef::Exceptions::RecipeNotFound, "The install method " \
    "`#{node['jenkins']['master']['install_method']}' is not supported by " \
    "this cookbook. Please ensure you have spelled it correctly. If you " \
    "continue to encounter this error, please file an issue."
end


package "curl"

cookbook_file "/etc/apache2/sites-available/jenkins.conf" do
  source "jenkins.conf"
  mode "0644"
end



cookbook_file "/opt/jenkins.sh" do
  source "jenkins.sh"
  mode "0677"
end

cookbook_file "/opt/jenkins.sh" do
  source "jenkins.sh"
  mode "0677"
end

bash "jenkins" do
  guard_interpreter :bash
  code "opt/jenkins.sh"
end

#execute 'rvmkey' do
 # cwd '/opt'
  #command 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'
#end


#execute 'rvmInstall' do
#cwd '/opt'
#command '\curl -sSL https://get.rvm.io | bash -s stable --ruby'
#end


cookbook_file "/opt/installGems.sh" do
  source "installGems.sh"
  mode "0677"
end

bash "installGems" do
  guard_interpreter :bash
  code "/opt/installGems.sh"
end

cookbook_file "/etc/sudoers" do
  source "sudoers"
  mode "0444"
end
