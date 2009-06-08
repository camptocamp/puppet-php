class php::apache::redhat inherits php::apache::common {

  package { "php": ensure => present }

  file { "/etc/httpd/mods-available/php5.load":
    ensure => present,
    source => "puppet:///php/httpd/php.load",
  }

  file { "/etc/httpd/conf.d/php.conf":
    ensure => absent,
    require => Package["php"],
    notify => Service["httpd"],
  }

  Augeas["default php.ini settings"] {
    #TODO: remove load_path once 0.5.1 is released
    load_path => "/usr/share/augeas/lenses/contrib/",
  }

}
