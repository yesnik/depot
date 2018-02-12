class Product < ApplicationRecord
  validates :title, :description, :image_url, :price, presence: true
end
