## Get the files from github



git '/opt/patchdashboard' do
  repository 'https://github.com/PatchDashboard/patchdashboard.git'
  revision 'master'
  action :sync
end

execute 'reset hard' do
  command 'cd /opt/patchdashboard; git reset --hard'
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
root_pass = db_settings['root_pass']

execute 'configure user and database for system' do
  command "mysql -h #{db_host} --port=#{db_port} --user=root --password=#{root_pass} -e 'CREATE DATABASE IF NOT EXISTS #{db_name}; GRANT ALL PRIVILEGES on #{db_name}.* TO \"#{db_user}\"@\"%\" IDENTIFIED BY \"#{db_pass}\"'"
end
execute 'import database' do
  command "mysql -h #{db_host} --port=#{db_port} --user=#{db_user} --password=#{db_pass} -D #{db_name} < /opt/patchdashboard/database/db_create.sql; touch /opt/patchdashboard/db_import.lock"
  not_if { ::File.exists?("/opt/patchdashboard/db_import.lock") }
end
execute 'move files in place' do
  command "if [ ! -f #{installation_path}/lib/db_config.php ]; then mv /opt/patchdashboard/html #{installation_path}; fi; find #{installation_path} -type f -print0|xargs -0 chmod 644;find #{installation_path} -type d -print0|xargs -0 chmod 755"
  not_if { ::File.exists?("#{installation_path}/lib/db_config.php") }
end

execute 'set ownership of resources' do
  case node[:platform]
    when 'ubuntu'
      command "chown www-data:www-data #{installation_path}/ -R"
    when 'centos', 'redhat'
      command "chown apache:apache #{installation_path}/ -R"
  end
end

template "/opt/patchdashboard/html/lib/db_config.php" do
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
    not_if { ::File.exists?("#{installation_path}/lib/db_config.php") }
end
