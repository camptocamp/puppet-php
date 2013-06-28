require 'spec_helper'

describe 'php', :type => 'class' do
  context 'on an unsupported osfamily' do
    let(:facts) { {
      :osfamily => 'Darwin',
      :operatingsystem => 'Darwin',
    } }
    it { expect { should fail(Puppet::Error, /Unsupported/) } }
  end

  context 'on a RedHat osfamily' do
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
    } }
    it { should include_class('php::redhat') }
  end

  context 'on a Debian osfamily' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }
    it { should include_class('php::debian') }
  end
end
