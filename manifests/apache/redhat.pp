class php::apache::redhat inherits php::apache::common {

  package { "php": ensure => present }

  Augeas["default php.ini settings"] {
    incl => "/etc/php.ini",
  }

  file { "/etc/httpd/mods-available/php5.load":
    ensure => present,
    source => "puppet:///modules/php/httpd/php.load",
  }

  file { "/etc/httpd/conf.d/php.conf":
    ensure => absent,
    require => Package["php"],
    notify => Service["apache"],
  }

}
