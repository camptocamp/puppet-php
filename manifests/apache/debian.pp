class php::apache::debian inherits php::apache::common {

  Augeas["default php.ini settings"] {
    incl => "/etc/php5/apache2/php.ini",
  }

  package { "libapache2-mod-php5": ensure => present }
}
