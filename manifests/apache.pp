class php::apache inherits php {

  case $operatingsystem {
    Debian: { include php::apache::debian }
    RedHat: { include php::apache::redhat }
  }

}
