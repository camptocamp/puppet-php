# Install PHP modules in an OS-agnostic fashion
# Uses the resource name as part of the package name. Preprends an os-specific
# prefix on supported platforms.
define php::module ($ensure='present') {

  case $::osfamily {

    Debian,Ubuntu: {
      $phpprefix = 'php5-'
    }
    RedHat,CentOS: {
      $phpprefix = 'php-'
    }
    default: { notice "Unsupported osfamily ${::osfamily}" }
  }


  $manage_notify = defined( Package['apache'] ) ? {
    true  => Service['apache'],
    false => undef,
  }

  package { "${phpprefix}${name}":
    ensure => $ensure,
    notify => $manage_notify,
  }

}
