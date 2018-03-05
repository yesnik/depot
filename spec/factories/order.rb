FactoryBot.define do
  factory :order do
    sequence(:name) { |n| "Joe Doe #{n}" }
    sequence(:address) { |n| "Street Famous, #{n}" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    pay_type 'Check'
  end
end
