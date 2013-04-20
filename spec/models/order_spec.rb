require 'spec_helper'

describe Order do
  context "validation" do
    context "email" do
      it "accepts a valid email" do
        order(:email => 'me@example.com').should be_valid
      end
      it "requires an email" do
        order(:email => nil).should_not be_valid
      end
      it "rejects an valid email" do
        order(:email => 'example.com').should_not be_valid
      end
    end

    context "line_items" do
      it "needs at least one line item" do
        order = FactoryGirl.build(:order, :line_items => [])
        order.should_not be_valid

        order.line_items << FactoryGirl.build(:line_item, :order => order)
        order.should be_valid
      end
    end
  end

  context "pricing" do
    it "treats orders adding to $0.00 to be free" do
      order = FactoryGirl.build(:order, :line_items => [
                FactoryGirl.build(:line_item, :price => 0)
              ])
      order.total_price.should == 0
      order.should be_free
    end
    it "adds the quantity * price of all tickets to calculate the total_price" do
      order = FactoryGirl.build(:order, :line_items => [
                FactoryGirl.build(:line_item, :price => 10),
                FactoryGirl.build(:line_item, :price => 20),
              ])
      order.total_price.should == 30
      order.should_not be_free
    end
  end

  context "state" do
    it "has an initial state" do
      order.should be_new
    end
    it "won't transition if the order is invalid" do
      order = FactoryGirl.build(:order)
      -> { order.confirm! }.should raise_error(StateMachine::InvalidTransition)
    end
    it "will save itself when transitioning" do
      order = FactoryGirl.build(:order, :with_line_items)
      order.confirm!
      order.should be_persisted
    end
    it "can immediately be resolved if the total price is nothing" do
      order = FactoryGirl.build(:order, :line_items => [
                FactoryGirl.build(:line_item, :price => 0),
              ])
      order.confirm!
      order.should be_free
      order.should be_resolved
    end
    it "will be payment-pending if owing" do
      order = FactoryGirl.build(:order, :line_items => [
                FactoryGirl.build(:line_item, :price => 10),
              ])
      order.confirm!
      order.needs_payment?.should be_true
      order.should be_payment_pending
    end
    it "will be payment-pending if still owing after payment" do
      order = FactoryGirl.build(:order, :line_items => [
                FactoryGirl.build(:line_item, :price => 10),
              ])
      order.confirm!

      order.stub(:balance => 5)
      order.resolve!
      order.needs_payment?.should be_true
      order.should be_payment_pending
    end
    it "will be refunding-pending if owed after payment" do
      order = FactoryGirl.build(:order, :line_items => [
                FactoryGirl.build(:line_item, :price => 10),
              ])
      order.confirm!

      order.stub(:balance => 15)
      order.resolve!
      order.needs_payment?.should be_false
      order.needs_refund?.should be_true
      order.should be_refund_pending
    end
    it "will be resolved if payment matches total price" do
      order = FactoryGirl.build(:order, :line_items => [
                FactoryGirl.build(:line_item, :price => 10),
              ])
      order.confirm!

      order.stub(:balance => 10)
      order.resolve!
      order.needs_payment?.should be_false
      order.needs_refund?.should be_false
      order.should be_resolved
    end
#    it "will successfully cancel if a refund will not be needed" do
#      order = FactoryGirl.build(:order, :line_items => [
#                FactoryGirl.build(:line_item, :price => 10),
#              ])
#      order.confirm!
#
#      order.stub(:balance => 0)
#      order.cancel!
#      order.needs_refund?.should be_false
#      order.should be_cancelled
#    end
#    it "will switch to refund if cancelled" do
#      order = FactoryGirl.build(:order, :line_items => [
#                FactoryGirl.build(:line_item, :price => 10),
#              ])
#      order.confirm!
#
#      order.stub(:balance => 10)
#      order.cancel!
#      order.needs_refund?.should be_true
#      order.should be_cancelled
#    end
  end

  def order(attr={})
    FactoryGirl.build(:order, :with_line_items, attr)
  end
end
