# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    # Nothing is compulsory
  end

  trait :with_orders do
    email { Faker::Internet.email }
    ignore do
      number_of_orders 1
    end
    after :build do |customer, ctx|
      customer.orders = FactoryGirl.build_list(:order, ctx.number_of_orders, {
        :customer => customer,
        :email => customer.email
      })
    end
  end
end
