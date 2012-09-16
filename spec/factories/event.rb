FactoryGirl.define do

  factory :event do
    name { Faker::Product.product }
  end

  factory :active_event, :parent => :event do
    opened_at { 1.week.ago }
    closed_at { 1.week.from_now }
    held_from { 9.days.from_now }
    held_to   { 11.days.from_now }
  end

  factory :future_event, :parent => :event do
    opened_at { 1.week.from_now }
    closed_at { 3.weeks.from_now }
    held_from { 29.days.from_now }
    held_to   { 31.days.from_now }
  end

  factory :closed_event, :parent => :event do
    opened_at { 2.weeks.ago }
    closed_at { 2.days.ago }
    held_from { 2.days.from_now }
    held_to   { 5.days.from_now }
  end

  factory :past_event, :parent => :event do
    opened_at { 5.weeks.ago }
    closed_at { 2.weeks.ago }
    held_from { 11.days.ago }
    held_to   { 9.days.ago }
  end

end
