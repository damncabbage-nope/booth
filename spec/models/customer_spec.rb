require 'spec_helper'

describe Customer do
  context "auth tokens" do
    let(:customer) { FactoryGirl.build(:customer) }
    let(:token) { 'nerpnerp' * 10 }
    before do
      Auth::Token.should_receive(:generate).once.and_return(token)
    end
    it "generates a random auth token on creation" do
      customer.token.should be_nil
      customer.save!
      customer.token.should == token
    end
    it "doesn't touch the auth token on save" do
      customer.save!
      customer.token.should == token
      customer.save!
      customer.token.should == token
    end
  end
end
