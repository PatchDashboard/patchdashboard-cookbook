#
# Cookbook Name:: patchdashboard
# Recipe:: _mysql
#
# Copyright (C) 2016 Jon Harris
#
# Licensed under the Apache License, Version 2.0
#
mysql_service 'patchdashboard' do
  port node['patchdashboard']['mysql']['port']
  initial_root_password node['patchdashboard']['mysql']['root_pass']
  socket '/var/run/mysqld/mysqld.sock'
  action [:create, :start]
end
