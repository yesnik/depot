FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Ruby Book #{n}" }
    description 'Nice book about Ruby'
    image_url 'book.jpg'
    price 100
  end
end
