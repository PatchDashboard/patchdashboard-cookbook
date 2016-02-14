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

## Enable mod_rewrite
execute 'enable rewrite' do
  command 'sudo a2enmod rewrite && service apache2 reload ||exit 0'
end

## Enable mod_ssl
execute 'enable ssl' do
  command 'sudo a2enmod ssl && service apache2 reload ||exit 0'
end

site_name = node['patchdashboard']['apache']['host']
web_app "patchdashboard" do
  server_name "#{site_name}"
  server_alias "www.#{site_name}"
  case node[:platform]
    when 'ubuntu'
      cookbook 'apache2'
    when 'centos', 'redhat'
      cookbook 'httpd'
  end
end
