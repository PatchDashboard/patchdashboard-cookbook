#
# Cookbook Name:: patchdashboard
# Recipe:: _dependant_packages
#
# Copyright (C) 2016 Jon Harris
#
# Licensed under the Apache License, Version 2.0
#

## Installing things for testing/debugging, as well as the mysql client library
yum_installs = ['mysql', 'vim-enhanced', 'git', 'php', 'php-mysql', 'php-mcrypt']
deb_install = ['mysql-client','vim', 'git', 'php5', 'php5-mysql', 'php5-mcrypt']


case node[:platform]
  when 'ubuntu'
    package deb_install do
      action :install
    end
  when 'centos', 'redhat'
    package yum_installs do
      action :install
    end
end
