# Install support for PHP
class php {

  case $::osfamily {

    'Debian': {
      include ::php::debian
    }
    'RedHat': {
      include ::php::redhat
    }
    default: { notice "Unsupported osfamily ${::osfamily}" }
  }

}
