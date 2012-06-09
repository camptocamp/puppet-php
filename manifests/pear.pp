define php::pear ($ensure="present") {

  case $::osfamily {
    Debian: { $phpprefix = 'php-' }
    RedHat: { $phpprefix = 'php-pear-' }
    default: { notice "Unsupported osfamily ${::osfamily}" }
  }

  package { "${phpprefix}${name}":
    ensure => $ensure,
  }
}
