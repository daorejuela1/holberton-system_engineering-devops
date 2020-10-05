#Removes every configuration for the domain holberton in limits
exec { 'fix--reads-holbertonuser':
  path     =>  '/usr/bin:/usr/sbin:/bin',
  provider =>  shell,
  command  =>  'sed -i \'/holberton/c\\\' /etc/security/limits.conf'
}
