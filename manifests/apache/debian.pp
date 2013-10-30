# Debian-specific implementation of PHP Apache integration
# Should not be called directly
class php::apache::debian inherits ::php::apache::common {

  Augeas['default php.ini settings'] {
    incl => '/etc/php5/apache2/php.ini',
  }

  package { 'libapache2-mod-php5':
    ensure => present ,
    before => [Apache_c2c::Module['php5'], Augeas['default php.ini settings']],
  }

}
