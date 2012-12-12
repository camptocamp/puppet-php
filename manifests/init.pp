class php {

  case $::osfamily {

    Debian,Ubuntu: {
      include php::debian
    }
    RedHat,CentOS: {
      include php::redhat
    }
    default: { notice "Unsupported osfamily ${::osfamily}" }
  }

}
