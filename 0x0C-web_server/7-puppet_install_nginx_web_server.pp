#This pupppet scripts assure an nginx installation

package {'nginx':
ensure => present,
name   => 'nginx',
}

file {'/usr/share/nginx/html/index.html':
ensure  =>  present,
path    => '/usr/share/nginx/html/index.html',
content => 'Holberton School for the win yeah!',
}

file {'/usr/share/nginx/html/custom_404.html':
ensure  => present,
path    => '/usr/share/nginx/html/custom_404.html',
content => "Ceci n'est pas une page",
}

file_line {'add redirect':
ensure => present,
path   => '/etc/nginx/sites-available/default',
after  => '#error_page 404 /404.html;',
line   => 'rewrite /redirect_me/   https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file_line {'add error redirect 1':
path    => '/etc/nginx/sites-available/default',
replace => true,
line    => 'error_page 404 /custom_404.html;',
match   => '#location ~ \\.php$ {',
}

file_line {'add error redirect 2':
path    => '/etc/nginx/sites-available/default',
replace => true,
line    => 'location = /custom_404.html { root /usr/share/nginx/html;internal; }/',
match   => '#location ~ /\.ht {',
}

service { 'nginx':
ensure  => running,
require => Package['nginx'],
}
