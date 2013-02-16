require 'spec_helper'

describe Event do
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

