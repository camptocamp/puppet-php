# Install php integration with Apache
class php::apache (
  $allow_url_fopen = 'Off',
  $expose_php = 'Off',
  $enable_dl = 'Off',
) inherits ::php {

  case $::osfamily {
    'Debian': {
      $php_ini = '/etc/php5/apache2/php.ini'
    }
    'RedHat': {
      $php_ini = '/etc/php.ini'

      file { '/etc/httpd/mods-available/php5.load':
        ensure  => file,
        content => file('php/httpd/php.load'),
        require => Apache_c2c::Module['php5'],
        notify  => Service['httpd'],
      }
      file { '/etc/httpd/conf.d/php.conf':
        ensure  => absent,
        require => Apache_c2c::Module['php5'],
        notify  => Service['httpd'],
      }

    }
    default: { notice("Unsupported osfamily ${::osfamily}")}
  }

  apache_c2c::module { 'php5':
    ensure => present,
    notify => Augeas['default php.ini settings'],
  }

  $_allow_url_fopen = $allow_url_fopen ? {
    true  => 'On', false => 'Off', default => $allow_url_fopen,
  }
  $_expose_php = $expose_php ? {
    true  => 'On', false => 'Off', default => $expose_php,
  }
  $_enable_dl = $enable_dl ? {
    true  => 'On', false => 'Off', default => $enable_dl,
  }
    
  augeas { 'default php.ini settings':
    lens    => 'PHP.lns',
    incl    => $php_ini,
    changes => [
      "set PHP/allow_url_fopen ${_allow_url_fopen}",
      "set PHP/expose_php ${_expose_php}",
      "set PHP/enable_dl ${_enable_dl}",
    ],
    require => Apache_c2c::Module['php5'],
    notify  => Service['httpd'],
  }

}
