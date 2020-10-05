# Ensures that the limit of open files for nginx is high
exec { 'fix--reads-holbertonuser':
  path     => '/usr/bin:/usr/sbin:/bin',
  provider => shell,
  notify   => Service['nginx'],
  command  => 'sed -i \'/holberton/c\' /etc/security/limits.conf'
}
service { 'nginx' :
  ensure => 'running',
  enable => 'true'
}

