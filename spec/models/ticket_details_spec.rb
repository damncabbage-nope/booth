require 'spec_helper'

describe TicketDetails do
  context "validation" do
    it "accepts a full name" do
      FactoryGirl.build(:ticket_details, :full_name => "Some Person With A Name")
                 .should be_valid
    end
    it "requires a full name" do
      FactoryGirl.build(:ticket_details, :full_name => nil)
                 .should_not be_valid
    end
  end
end
