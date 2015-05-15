name             'wordpress_app'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures wordpress_app'
long_description 'Installs/Configures wordpress_app'
version          '0.1.0'

depends 'wordpress'
depends 'apt'
depends 'mysql', '~> 4.1'
depends 'mysql2_chef_gem', '= 0.1.1'

