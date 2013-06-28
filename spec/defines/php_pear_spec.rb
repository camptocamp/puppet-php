require 'spec_helper'

describe 'php::pear', :type => 'define' do
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
    it { should contain_package('php-pear-testmodule') }
    it { should_not contain_package('php-testmodule') }
  end

  context 'on a Debian osfamily' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }
    it { should contain_package('php-testmodule') }
    it { should_not contain_package('php-pear-testmodule') }
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
      it { should contain_package('php-pear-testmodule').with_ensure('absent') }
    end

    context 'on a Debian osfamily' do
      let(:facts) { {
        :osfamily => 'Debian',
        :operatingsystem => 'Ubuntu',
      } }
      it { should contain_package('php-testmodule').with_ensure('absent') }
    end
  end

end
