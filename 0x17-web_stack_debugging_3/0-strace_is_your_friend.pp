file_line { 'wp-settings':
  path    => '/var/www/html/wp-settings.php',
  replace => true,
  line    => "require_once( ABSPATH . WPINC . '/class-wp-locale.phpp' );",
  match   => "require_once( ABSPATH . WPINC . '/class-wp-locale.php' );"
}
