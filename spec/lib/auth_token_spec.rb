require 'spec_helper'

describe Auth::Token do
  it "specifies a URL param tokens should use" do
    Auth::Token.param.should == :tk
  end

  it "generates a random token" do
    token = Auth::Token.generate
    token.should be_a String
    token.should_not == Auth::Token.generate
    token.length.should be_between(80, 100)
  end
end
