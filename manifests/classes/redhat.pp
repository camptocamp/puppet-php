class php::redhat {

  file { "/usr/share/augeas/lenses/contrib/php.aug":
    ensure => present,
    source => "puppet:///php/php.aug",
  }

  package { "php-cli": ensure => present }

}
