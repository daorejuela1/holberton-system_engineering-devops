#This pupppet scripts assure an nginx installation

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
ensure  =>  present,
path    => '/var/www/html/index.html',
content => 'Holberton School for the win yeah!\n',
}

file_line {'add redirect':
ensure  => present,
path    => '/etc/nginx/sites-available/default',
replace => true,
line    => '	rewrite /redirect_me/ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
match   => '# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000',
}

file_line {'add protocol':
ensure => present,
path   => '/etc/nginx/sites-available/default',
after  => 'listen 80 default_server;',
line   => "\tadd_header X-Served-By ${hostname};",
}
