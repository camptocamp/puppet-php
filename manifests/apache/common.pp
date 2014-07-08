# Common resources for apache integration shared between Operating systems
# Should not be called directly.
class php::apache::common inherits php {

  augeas { 'default php.ini settings':
    lens    => 'PHP.lns',
    changes => [
      'set PHP/allow_url_fopen Off',
      'set PHP/expose_php Off',
      'set PHP/enable_dl Off',
    ],
    notify  => Service['httpd'],
  }

  apache_c2c::module { 'php5':
    ensure => present,
    notify => Augeas['default php.ini settings'],
  }
}
