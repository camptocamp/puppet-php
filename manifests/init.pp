class php {

  case $operatingsystem {

    Debian,Ubuntu: {
      include php::debian
    }
    RedHat,CentOS: {
      include php::redhat
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

}
