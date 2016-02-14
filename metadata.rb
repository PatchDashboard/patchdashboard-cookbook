name             'patchdashboard'
maintainer       'Jon Harris'
maintainer_email 'patchdashboard-cookbook@jonsjava.com'
license          'Licensed under the Apache License, Version 2.0'
description      'Installs/Configures patchdashboard'
long_description 'Installs Patch Management Dashboard.'
version          '0.1.0'


depends 'mysql', '~> 6.0'
depends 'cron', '~> 1.7.3'
depends 'apache2'
