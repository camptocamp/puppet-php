class php::apache::common inherits php {

  augeas { "default php.ini settings":
    context => "/files/${phpini}",
    changes => [
      "set PHP/allow_url_fopen Off",
      "set PHP/expose_php Off",
      "set PHP/enable_dl Off",
    ],
    notify => Service["apache"],
  }

  apache::module { "php5":
    ensure => present,
    require => Augeas["default php.ini settings"],
  }
}
