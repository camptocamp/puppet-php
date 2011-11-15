define php::pear ($ensure="present") {

  case $operatingsystem {
    Debian: { $phpprefix = "php-" }
    RedHat: { $phpprefix = "php-pear-" }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

  package { "${phpprefix}${name}":
    ensure => $ensure,
  }
}
