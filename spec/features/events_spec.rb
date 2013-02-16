require 'spec_helper'

describe "Events" do
  context "when visiting the homepage" do

    context "with one visible event" do
      let!(:open_event) { FactoryGirl.create(:open_event) }
      let!(:past_event) { FactoryGirl.create(:past_event) }

      before do
        visit root_path
      end

      it "should take the customer to the event's page directly" do
        current_path.should == event_path(open_event)
      end
    end

    context "with multiple visible events" do
      let!(:future_event) { FactoryGirl.create(:future_event) }
      let!(:open_event)   { FactoryGirl.create(:open_event) }
      let!(:closed_event) { FactoryGirl.create(:closed_event) }
      let!(:past_event)   { FactoryGirl.create(:past_event) }

      before do
        visit root_path
      end

      it "should display the future, active and closed events" do
        page.should have_selector(".events > .event", :count => 3)
        # Break the following out to check for name, held dates, blurb
        # and a link to more details.
        page.should have_content(future_event.name)
        page.should have_content(open_event.name)
        page.should have_content(closed_event.name)
      end
    end

  end
end

