class php {

  case $operatingsystem {

    Debian: {
      $phpini = "/etc/php5/cli/php.ini"
      $phpinidir = "/etc/php5/conf.d/"

      include php::debian
    }
    RedHat: {
      $phpini = "/etc/php.ini"
      $phpinidir = "/etc/php.d/"

      include php::redhat
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }

}
