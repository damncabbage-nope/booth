require 'spec_helper'

describe Event do
  context "validation" do
    subject { FactoryGirl.build(:open_event) }

    it "requires sales-open, sales-closed, beginning and end dates to be in order" do
      # Anchor it a week ago; every other date should follow it.
      subject.sales_opened_at = 7.days.ago

      valid?(:sales_closed_at, 8.days.ago).should be_false
      valid?(:sales_closed_at, 2.days.ago).should be_true

      valid?(:began_at, 5.days.ago).should be_false
      valid?(:began_at, 1.day.ago).should be_true

      valid?(:finished_at, 4.days.ago).should be_false
      valid?(:finished_at, 2.days.from_now).should be_true
    end

    # Helpers

    def valid?(attribute, value)
      subject.send("#{attribute}=", value)
      subject.valid?
    end
  end

  context "scopes" do
    let!(:future_event)  { FactoryGirl.create(:future_event) }
    let!(:open_event)    { FactoryGirl.create(:open_event) }
    let!(:closed_event)  { FactoryGirl.create(:closed_event) }
    let!(:running_event) { FactoryGirl.create(:running_event) }
    let!(:past_event)    { FactoryGirl.create(:past_event) }

    context "active" do
      let(:events) { Event.active }
      it("includes future events")  { should_include_in events, future_event }
      it("includes open events")    { should_include_in events, open_event }
      it("includes closed events")  { should_include_in events, closed_event }
      it("includes running events") { should_include_in events, running_event }

      it("excludes past events") { should_exclude_from events, past_event }
    end

    def should_include_in(events, desired_event)
      events.map(&:id).include?(desired_event.id).should be_true
    end
    def should_exclude_from(events, desired_event)
      events.map(&:id).include?(desired_event.id).should be_false
    end
  end
end

