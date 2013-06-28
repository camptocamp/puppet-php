require 'spec_helper'

describe 'php::module', :type => 'define' do
  let(:title) { 'testmodule' }
  context 'on an unsupported osfamily' do
    let(:facts) { {
      :osfamily => 'Darwin',
      :operatingsystem => 'Darwin',
    } }
    # FIXME: Class emits a notice, but doesn't fail properly
    it { should contain_package('testmodule') }
  end

  context 'on a RedHat osfamily' do
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
    } }
    it { should contain_package('php-testmodule') }
    it { should_not contain_package('php5-testmodule') }
  end

  context 'on a Debian osfamily' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }
    it { should contain_package('php5-testmodule') }
    it { should_not contain_package('php-testmodule') }
  end

  context 'with apache' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }
    let(:preconditions) { [
      'include apache',
    ] }
    it { should contain_package('php5-testmodule') }
    # FIXME: can't figure out how to test for notify metaparam
    #.with_notify( 'Service["apache"]') }
  end

  context 'with ensure = absent' do
    let(:params) { {
      :ensure => 'absent',
    } }
    context 'on a RedHat osfamily' do
      let(:facts) { {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
      } }
      it { should contain_package('php-testmodule').with_ensure('absent') }
    end

    context 'on a Debian osfamily' do
      let(:facts) { {
        :osfamily => 'Debian',
        :operatingsystem => 'Ubuntu',
      } }
      it { should contain_package('php5-testmodule').with_ensure('absent') }
    end
  end

end
