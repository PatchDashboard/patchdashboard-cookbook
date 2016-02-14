#
# Cookbook Name:: patchdashboard
# Recipe:: _apache
#
# Copyright (C) 2016 Jon Harris
#
# Licensed under the Apache License, Version 2.0
#

## Install Apache2/Httpd -- depending on distro

package 'apache' do
  case node[:platform]
    when 'ubuntu'
      package_name 'apache2'
    when 'centos', 'redhat'
      package_name 'httpd'
  end
end


apache_module 'mpm_event' do
  enable false
end
enable_mods = ["mpm_prefork", "ssl", "rewrite"]

enable_mods.each do |mods_to_enable|
  apache_module "enable #{mods_to_enable}" do
    enable true
  end
end


site_name = node['patchdashboard']['apache']['host']
web_app "patchdashboard" do
  server_name "#{site_name}"
  server_alias "www.#{site_name}"
  docroot node['patchdashboard']['apache']['path']
  case node[:platform]
    when 'ubuntu'
      cookbook 'apache2'
    when 'centos', 'redhat'
      cookbook 'httpd'
  end
end
