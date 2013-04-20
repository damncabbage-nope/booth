require 'spec_helper'

describe Order do
  context "validation" do
    context "email" do
      it "accepts a valid email" do
        FactoryGirl.build(:order, :with_line_items, :email => 'me@example.com')
                   .should be_valid
      end
      it "requires an email" do
        FactoryGirl.build(:order, :with_line_items, :email => nil)
                   .should_not be_valid
      end
      it "rejects an valid email" do
        FactoryGirl.build(:order, :with_line_items, :email => 'example.com')
                   .should_not be_valid
      end
    end

    context "line_items" do
      it "needs at least one line item" do
        order = FactoryGirl.build(:order)
        order.should_not be_valid

        order.line_items << FactoryGirl.build(:line_item, :order => order)
        order.should be_valid
      end
    end
  end
end
