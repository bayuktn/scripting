<?php
  $config['db_dsnw'] = 'mysql://root:roundcube-mysql-pw@roundcubedb:3306/roundcubemail';
  $config['db_dsnr'] = '';
  $config['default_host'] = 'tls://mail.devlmu.com';
  $config['default_port'] = '143';
  $config['smtp_server'] = 'tls://mail.devlmu.com';
  $config['smtp_port'] = '587';
  $config['temp_dir'] = '/tmp/roundcube-temp';
  $config['skin'] = 'elastic';
  $config['plugins'] = array_filter(array_unique(array_merge($config['plugins'], ['archive', 'zipdownload'])));
  
