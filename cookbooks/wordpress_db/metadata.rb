name             'wordpress_db'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures wordpress_db'
long_description 'Installs/Configures wordpress_db'
version          '0.1.0'

depends 'apt'
depends 'mysql', '~> 4.1'
depends 'database'
depends 'mysql2_chef_gem', '= 0.1.1'
