require 'spec_helper'
describe 'syslogd' do

  context 'with defaults for all parameters' do
    it { should contain_class('syslogd') }
  end
end
