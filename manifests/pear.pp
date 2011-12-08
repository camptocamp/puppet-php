define php::pear ($ensure="present") {

  case $operatingsystem {
    Debian,Ubuntu: { $phpprefix = "php-" }
    RedHat,CentOS: { $phpprefix = "php-pear-" }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

  package { "${phpprefix}${name}":
    ensure => $ensure,
  }
}
