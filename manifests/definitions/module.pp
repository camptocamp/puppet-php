define php::module ($ensure="present") {

  case $operatingsystem {

    Debian: {
      $phpprefix = "php5-"
    }
    RedHat: {
      $phpprefix = "php-"
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }


  if defined(Package[$apache]) {
    package { "${phpprefix}${name}":
      ensure => $ensure,
      notify => Service["apache"],
    }
  }
  else {
    package { "${phpprefix}${name}":
      ensure => $ensure,
    }
  }

}
