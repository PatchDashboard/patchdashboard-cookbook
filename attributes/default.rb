## Change the salt to anything that is fairly secure.
default['patchdashboard']['salt'] = 'AUBASR`bX]WQWbcIR^FRHBcXRaHW'
default['patchdashboard']['company_name'] = "Your Company, INC"
default['patchdashboard']['mysql']['host'] = 'localhost'
default['patchdashboard']['mysql']['port'] = '3306'
default['patchdashboard']['mysql']['root_pass'] = 'vagrant'
default['patchdashboard']['mysql']['db_user'] = 'pdb'
default['patchdashboard']['mysql']['db_pass'] = 'vagrant'
default['patchdashboard']['mysql']['database'] = 'pdb'
default['patchdashboard']['apache']['path'] = '/var/www/patchmd'
default['patchdashboard']['apache']['use_ssl'] = true
default['patchdashboard']['apache']['http_port'] = '80'
default['patchdashboard']['apache']['https_port'] = '443'
default['patchdashboard']['apache']['host'] = 'patchdashboard.local'
