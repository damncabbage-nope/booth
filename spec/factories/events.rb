FactoryGirl.define do

  factory :event do
    name { Faker::Product.product }
    tagline { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs }
  end

  factory :future_event, :parent => :event do
    sales_opened_at { 1.week.from_now }
    sales_closed_at { 3.weeks.from_now }
    began_at    { 29.days.from_now }
    finished_at { 31.days.from_now }
  end

  factory :open_event, :parent => :event do
    sales_opened_at { 1.week.ago }
    sales_closed_at { 1.week.from_now }
    began_at    { 9.days.from_now }
    finished_at { 11.days.from_now }
  end

  factory :closed_event, :parent => :event do
    sales_opened_at { 2.weeks.ago }
    sales_closed_at { 2.days.ago }
    began_at    { 2.days.from_now }
    finished_at { 5.days.from_now }
  end

  factory :running_event, :parent => :event do
    sales_opened_at { 2.weeks.ago }
    sales_closed_at { 2.days.ago }
    began_at    { 1.day.ago }
    finished_at { 1.day.from_now }
  end

  factory :past_event, :parent => :event do
    sales_opened_at { 5.weeks.ago }
    sales_closed_at { 2.weeks.ago }
    began_at    { 11.days.ago }
    finished_at { 9.days.ago }
  end

end
