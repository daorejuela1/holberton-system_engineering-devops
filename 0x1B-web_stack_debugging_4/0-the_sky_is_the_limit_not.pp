#Ensures that the limit of open files for nginx is high
exec { 'fix--for-nginx':
  path     => '/usr/bin:/usr/sbin:/bin',
  provider => shell,
  notify   => Service['nginx'],
  command  => 'sed -i \'/ULIMIT=/c\ULIMIT="-n 4069"\' /etc/default/nginx'
}
service { 'nginx' :
  ensure => 'running',
  enable => 'true'
}

