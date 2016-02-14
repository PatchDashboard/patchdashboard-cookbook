Vagrant.configure("2") do |config|

  config.hostmanager.manage_host = true
  config.hostmanager.enabled = true

  config.hostmanager.aliases = %w(
    patchdashboard.local
    www.patchdashboard.local
  )

end
