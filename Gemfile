source 'https://rubygems.org'

facter_version = ENV.key?('FACTER_VERSION') ? "= #{ENV['FACTER_VERSION']}" : \
  '= 1.6.7' # from puppet enterprise 2.5.1
puppet_version = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : \
  '= 2.7.12' # from puppet enterprise 2.5.1
hiera_version = ENV.key?('HIERA_VERSION') ? "= #{ENV['HIERA_VERSION']}" : \
  '= 0.3.0' # from puppet enterprise 2.5.1

rspec_version = ENV.key?('RSPEC_VERSION') ? "= #{ENV['RSPEC_VERSION']}" : \
  '>= 2.9'

hiera_spec_gem = ENV.key?('HIERA_SPEC_GEM') ? ENV['HIERA_SPEC_GEM'] :\
  'hiera-puppet-helper'
hiera_spec_gem_version =  ENV.key?('HIERA_SPEC_GEM_VERSION') ?\
ENV['HIERA_SPEC_GEM_VERSION'] : '1.0.1'

gem 'rake'
gem 'rspec', rspec_version
gem 'facter', facter_version
gem 'puppet', puppet_version

## Puppet 2.7 does not include hiera.
if puppet_version =~ /^([^0-9]+)?([^\.]|)2(\..*?)$/
  gem 'hiera', hiera_version
  gem 'hiera-puppet', hiera_version
end

gem 'puppet-lint'
gem hiera_spec_gem, hiera_spec_gem_version

gem 'puppetlabs_spec_helper'
gem 'git'
gem "ci_reporter"
