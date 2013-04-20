require 'spec_helper'

describe Order do
  context "validation" do
    it "accepts a valid email" do
      Order.new(:email => 'me@example.com').should be_valid
    end
    it "requires an email" do
      Order.new.should_not be_valid
    end
    it "rejects an valid email" do
      Order.new(:email => 'example.com').should_not be_valid
    end
  end
end
