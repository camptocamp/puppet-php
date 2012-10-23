class php {

  case $operatingsystem {

    Debian: {
      include php::debian
    }
    RedHat: {
      include php::redhat
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

}
