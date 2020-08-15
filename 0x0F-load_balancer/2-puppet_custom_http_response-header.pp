#This pupppet scripts assure an nginx installation

exec { '/usr/bin/env apt-get -y update':}
package {'nginx':
ensure => present,
name   => 'nginx',
}

service { 'nginx':
ensure     => running,
enable     => true,
hasrestart => true,
require    => Package['nginx'],
subscribe  => File_line['add protocol'],
}

file {'/var/www/html/index.html':
content => 'Holberton School for the win yeah!\n',
}

file_line {'add protocol':
ensure => present,
path   => '/etc/nginx/sites-available/default',
after  => 'listen 80 default_server;',
line   => "\tadd_header X-Served-By ${hostname};",
}
