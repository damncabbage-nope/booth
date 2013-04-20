FactoryGirl.define do
  factory :ticket_type do
    name  { Faker::Company.name }
    price { rand(20..50) }
  end
end
