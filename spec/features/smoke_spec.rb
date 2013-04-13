require 'spec_helper'

describe "Smoke Test", :js => true do
  it "lets users purchase tickets" do
    # Setup
    event = FactoryGirl.create(:open_event)

    go_to_event_page(event)

    add_tickets_to_cart 2
    go_back_to_events_page
    add_tickets_to_cart 1

    fill_in_ticket_details_with [
      "One Potato",
      "Two Tomato",
      "Three"
    ]
    fill_in_billing_details
    fill_in_payment_details
    submit_order

    page.should have_content "Success!"
  end

  def go_to_event_page(event)
    visit root_path
    current_path.should == event_path(event)
  end

  def add_tickets_to_cart(number)
    select number.to_s, :from => "Tickets"
    click_button "Add to Cart"
    current_path.should == orders_checkout_path
  end

  def go_back_to_events_page
    click_link "Go back to the list of events"
  end

  def fill_in_ticket_details_with(names)
    names.each_with_index do |name, idx|
      fill_in "Ticket ##{idx + 1}", :with => name
    end
  end

  def fill_in_billing_details
    fill_in "Full Name", :with => "Rob Howard"
    fill_in "Address", :with => "123 Fake Street"
    fill_in "City", :with => "Sydney"
    fill_in "State", :with => "NSW"
    fill_in "Postcode", :with => "2000"
    select "Australia", :from => "Country"
  end

  def fill_in_payment_details
    fill_in "Credit Card",  :with => "4111 1111 1111 1111"
    fill_in "Name on Card", :with => "Not Rob Howard"
    fill_in "Expiry Month", :with => "01"
    fill_in "Expiry Year",  :with => (Time.now.year + 2).to_s
    fill_in "CVC", :with => "999"
  end

  def submit_order
    click_button "Submit"
  end
end
