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
  command 'sudo a2enmod rewrite || exit 0'
end

## Enable mod_ssl
execute 'enable ssl' do
  command 'sudo a2enmod ssl ||exit 0'
end

execute 'disable mpm_event' do
  command 'sudo a2dismod mpm_event||exit 0'
end


execute 'enable mpm_prefork' do
  command 'sudo a2enmod mpm_prefork ||exit 0'
end


execute 'restart apache' do
  command 'sudo service apache2 restart'
end



site_name = node['patchdashboard']['apache']['host']

case node[:platform]
  when 'ubuntu'
    template_dest = '/etc/apache2/sites-available/patchdashboard.conf'
  else
    template_dest = '/etc/httpd/conf.d/patchdashboard.conf'
end

template "#{template_dest}" do
  source 'vhost.erb'
  mode '0644'
  variables ({
    :server_name => node['patchdashboard']['apache']['host'],
    :docroot => node['patchdashboard']['apache']['path']
    })
end

execute 'enable patchdashboard vhost' do
  command 'a2ensite patchdashboard && service apache2 restart || exit 0'
end
