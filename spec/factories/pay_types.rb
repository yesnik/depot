FactoryBot.define do
  factory :pay_type do
    sequence(:title) { |n| "Pay type #{n}" }
  end
end
