# Redhat-specific resources for the PHP class
# Should not be called directly
class php::redhat {

  package { 'php-cli': ensure => present }

}
