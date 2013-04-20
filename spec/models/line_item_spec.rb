require 'spec_helper'

describe LineItem do
  context "validation" do
    context "price" do
      it "accepts a valid price" do
        FactoryGirl.build(:line_item, :price => 25)
                   .should be_valid
      end
      it "requires a price" do
        FactoryGirl.build(:line_item, :price => nil)
                   .should_not be_valid
      end
      it "rejects an invalid price" do
        FactoryGirl.build(:line_item, :price => "nope").should_not be_valid
        FactoryGirl.build(:line_item, :price => -5).should_not be_valid
      end
    end
  end
end
