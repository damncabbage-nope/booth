require 'spec_helper'

describe TicketType do
  context "validation" do
    context "price" do
      it "accepts a valid price" do
        FactoryGirl.build(:ticket_type, :price => 25)
                   .should be_valid
      end
      it "requires a price" do
        FactoryGirl.build(:ticket_type, :price => nil)
                   .should_not be_valid
      end
      it "rejects an invalid price" do
        FactoryGirl.build(:ticket_type, :price => "nope").should_not be_valid
        FactoryGirl.build(:ticket_type, :price => -5).should_not be_valid
      end
    end
  end
end
