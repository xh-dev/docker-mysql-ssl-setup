<?php
/* Encrypted connection to DB */
$cfg['Servers'][$i]['ssl'] = true;
$cfg['Servers'][$i]['ssl_ca'] = '/etc/phpmyadmin/ca-cert.pem';
$cfg['Servers'][$i]['ssl_cert'] = '/etc/phpmyadmin/client-cert.pem';
$cfg['Servers'][$i]['ssl_key'] = '/etc/phpmyadmin/client-key.pem';
$cfg['Servers'][$i]['ssl_ciphers'] = 'DHE-RSA-AES256-SHA';