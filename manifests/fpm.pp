# Install support for PHP-FPM Fast-CGI implementation
class php::fpm {

  case $::osfamily {

    'Debian': {
      package { 'php5-fpm':
        ensure => present,
      } ->
      service { 'php5-fpm':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
      }
    }

    'RedHat': {
      #TODO
    }
    default: { notice("Unsupported osfamily ${::osfamily}") }
  }
}
