FactoryGirl.define do
  factory :order do
    email { Faker::Internet.email }

    # Requires a customer
    after :build do |order, ctx|
      order.customer ||= FactoryGirl.build(:customer)
    end
  end

  trait :with_line_items do
    ignore do
      number_of_line_items 2
    end
    after :build do |order, ctx|
      order.line_items = FactoryGirl.build_list(
        :line_item,
        ctx.number_of_line_items,
        :order => order
      )
    end
  end
end
