require 'spec_helper'

describe 'php::fpm', :type => 'class' do
  context 'on an unsupported osfamily' do
    let(:facts) { {
      :osfamily => 'Darwin',
      :operatingsystem => 'Darwin',
    } }
    it { should_not contain_package('php5-fpm') }
  end

  context 'on a RedHat osfamily' do
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
    } }
    # Not implemented yet
    #it { should include_class('php::redhat') }
  end

  context 'on a Debian osfamily' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }
    it { should contain_package('php5-fpm').with_ensure('present') }
    it { should contain_service('php5-fpm').with( {
      :ensure => 'running',
      :enable => true,
      :hasstatus => true,
      :hasrestart => true,
    } ) }
  end

end
