FactoryBot.define do
  factory :line_item do
    product
    cart
    quantity 1
  end
end
