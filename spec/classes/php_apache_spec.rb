require 'spec_helper'

describe 'php::apache', :type => 'class' do
  context 'on an unsupported osfamily' do
    let(:facts) { {
      :osfamily => 'Darwin',
      :operatingsystem => 'Darwin',
    } }
    it { should_not contain_package('php::apache::debian') }
    it { should_not contain_package('php::apache::redhat') }
  end

  context 'on a RedHat osfamily' do
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
    } }
    it { should include_class('php::apache::redhat') }
    it { should_not contain_package('php::apache::debian') }
  end

  context 'on a Debian osfamily' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }
    it { should include_class('php::apache::debian') }
    it { should_not contain_package('php::apache::redhat') }
  end
end
