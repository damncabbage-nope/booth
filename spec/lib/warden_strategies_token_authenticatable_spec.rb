require 'spec_helper'

describe Warden::Strategies::TokenAuthenticatable do
  let(:request)  { double('Request') }
  let(:strategy) { Warden::Strategies::TokenAuthenticatable.new({}) }

  context "#valid?" do
    it "fails to validate params without a token" do
      strategy.stub(:params => {})
      strategy.should_not be_valid
    end

    it "fails to validate params with a blank token" do
      strategy.stub(:params => { :tk => "" })
      strategy.should_not be_valid
    end

    it "validates that a non-blank token for later authentication" do
      strategy.stub(:params => { :tk => "yep" })
      strategy.should be_valid
    end
  end

  context "authenticate!" do
    before do
      Rails.logger.stub(:info)
      Rails.logger.stub(:debug)
    end
    pending "authenticates with a token that has an associated customer"
    pending "fails to authenticate with a token that has no associated customer"
  end
end
