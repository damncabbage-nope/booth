# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket_details, :class => 'TicketDetails' do
    full_name { Faker::Name.name }
  end
end
