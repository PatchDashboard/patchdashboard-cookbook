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
apache_module 'rewrite' do
  conf true
end


site-name = data_bag_item('patchdashboard')[node.chef_environment][node['testing-patchdashboard']['url']]

web_app "patchdashboard" do
  server_name site-name
  server_alias "www.#{site-name}"
  when 'ubuntu'
    cookbook 'apache2'
  when 'centos', 'redhat'
    cookbook 'httpd'
  end
end
