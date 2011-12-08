class php::apache inherits php {

  case $operatingsystem {
    Debian,Ubuntu: { include php::apache::debian }
    RedHat,CentOS:: { include php::apache::redhat }
  }

}
