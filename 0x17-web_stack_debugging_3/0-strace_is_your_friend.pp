# This script looks onto the wordpress config file and replaces its bad value
exec { 'replace_wrong':
  command => "sed -i 's/class-wp-locale.phpp/class-wp-locale.php/' /var/www/html/wp-settings.php",
  path    =>  '/bin:/usr/bin:/sbin:/usr/sbin:...'
}
