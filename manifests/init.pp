class php {

  case $operatingsystem {

    Debian: {
      include php::debian
    }
    RedHat,CentOS: {
      include php::redhat
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

}
