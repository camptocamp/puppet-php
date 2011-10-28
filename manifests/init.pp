import "*/*.pp"

class php {

  case $operatingsystem {

    Debian,Ubuntu: {
      $phpini = "/etc/php5/cli/php.ini"
      $phpinidir = "/etc/php5/conf.d/"

      include php::debian
    }
    RedHat,CentOS: {
      $phpini = "/etc/php.ini"
      $phpinidir = "/etc/php.d/"

      include php::redhat
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

}

class php::apache inherits php {

  case $operatingsystem {
    Debian,Ubuntu: { include php::apache::debian }
    RedHat,CentOS: { include php::apache::redhat }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

}
