FactoryGirl.define do
  factory :line_item do
    price { rand(20..50) }

    after :build do |line_item, ctx|
      line_item.order = FactoryGirl.build(:order) unless line_item.order
      line_item.product = FactoryGirl.build(:ticket_type) unless line_item.product
      line_item.details = FactoryGirl.build(:ticket_details) unless line_item.details
    end
  end
end
