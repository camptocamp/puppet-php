require 'spec_helper'

describe 'php::apache' do

  let(:pre_condition) do
    "include ::apache_c2c"
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/tmp',
        })
      end

      it { is_expected.to compile.with_all_deps }
    end
  end
end
