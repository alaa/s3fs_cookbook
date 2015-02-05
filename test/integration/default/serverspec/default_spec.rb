require 'spec_helper'

describe "s3fs binary" do
  @file = '/usr/bin/s3fs'

  describe file(@file) do
    it { should be_file }
  end
end

