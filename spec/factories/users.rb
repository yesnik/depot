FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    password "123"
  end
end
