FactoryGirl.define do
  factory :line_item do
    price { rand(20..50) }

    after :build do |line_item, ctx|
      line_item.order   ||= FactoryGirl.build(:order)
      line_item.product ||= FactoryGirl.build(:ticket_type, :price => line_item.price)
      line_item.details ||= FactoryGirl.build(:ticket_details)
    end
  end
end
