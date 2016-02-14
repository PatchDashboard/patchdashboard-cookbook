## Get the files from github

git '/opt/patchdashboard' do
  repository 'https://github.com/PatchDashboard/patchdashboard.git'
  revision 'master'
  action :sync
end

## Run some scripts and set up the application
install_hash = node['patchdashboard']['salt']
installation_path = node['patchdashboard']['apache']['path']
company_name = node['patchdashboard']['company_name']

db_settings = node['patchdashboard']['mysql']
db_user = db_settings['db_user']
db_host = db_settings['host']
db_port = db_settings['port']
db_pass = db_settings['db_pass']
db_name = db_settings['database']

template "/opt/patchdashboard/html/inc/db_config.php" do
  source 'db_config.erb'
  mode '0644'
  variables ({
    :hash_code => install_hash,
    :company => company_name,
    :database_host => db_host,
    :database_port => db_port,
    :database_user => db_user,
    :database_pass => db_pass,
    :database_name => db_name
    })
end
