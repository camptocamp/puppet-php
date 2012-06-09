class php::apache inherits php {

  case $::osfamily {
    Debian: { include php::apache::debian }
    RedHat: { include php::apache::redhat }
  }

}
