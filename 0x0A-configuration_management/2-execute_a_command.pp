# This will ensure that a command is executed
exec {'killmenow':
command => 'pkill killmenow',
path    => '/usr/bin:/usr/sbin:/bin'
}
