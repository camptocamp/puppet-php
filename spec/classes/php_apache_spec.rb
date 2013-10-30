require 'spec_helper'

describe 'php::apache', :type => 'class' do
  context 'on an unsupported osfamily' do
    let(:facts) { {
      :osfamily => 'Darwin',
      :operatingsystem => 'Darwin',
    } }
    it { should_not include_class('php::apache::debian') }
    it { should_not include_class('php::apache::redhat') }
  end

  context 'on a supported osfamily' do
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
    } }
    it { should contain_augeas('default php.ini settings').with({
      :lens => 'PHP.lns',
      :changes => [
        'set PHP/allow_url_fopen Off',
        'set PHP/expose_php Off',
        'set PHP/enable_dl Off',
      ],
    }) }
    it { should contain_apache__module('php5') }

    context 'on a RedHat osfamily' do
      let(:facts) { {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
      } }
      it { should contain_augeas('default php.ini settings')\
        .with_incl('/etc/php.ini') }
      it { should contain_file('/etc/httpd/mods-available/php5.load')\
        .with_ensure('present') }
      it { should contain_file('/etc/httpd/conf.d/php.conf')\
        .with_ensure('absent') }
    end

    context 'on a Debian osfamily' do
      let(:facts) { {
        :osfamily => 'Debian',
        :operatingsystem => 'Ubuntu',
      } }
      it { should contain_augeas('default php.ini settings')\
        .with_incl('/etc/php5/apache2/php.ini') }
      it { should contain_package('libapache2-mod-php5') }
    end
  end
end
