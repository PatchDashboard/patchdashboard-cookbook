name             'patchdashboard'
maintainer       'Jon Harris'
maintainer_email 'patchdashboard-cookbook@jonsjava.com'
license          'Apache Foundation'
description      'Installs/Configures patchdashboard'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'
version          '0.1.0'


depends 'mysql', '~> 6.0'
depends 'cron', '~> 1.7.3'
depends 'apache2'
