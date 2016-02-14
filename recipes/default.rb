#
# Cookbook Name:: patchdashboard
# Recipe:: default
#
# Copyright (C) 2016 Jon Harris
#
# Licensed under the Apache License, Version 2.0
#
include_recipe 'patchdashboard::_dependant_packages'
include_recipe 'patchdashboard::_apache'
if (node['patchdashboard']['mysql']['host'] == "localhost" || node['patchdashboard']['mysql']['host'] == "127.0.0.1")
  include_recipe 'patchdashboard::_mysql'
end
include_recipe 'patchdashboard::_install_pdb'
