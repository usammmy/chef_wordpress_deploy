require 'spec_helper'

describe 'wordpress_db::default' do

  describe service 'mysql' do
    it { should be enabled }
	it { should be running }
  end

end