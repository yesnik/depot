class Product < ApplicationRecord
  validates :description, :image_url, :price, presence: true
  validates :title,
  			length: {minimum: 5,
  					 message: 'Title length should be minimum 5 characters'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: {case_sensitive: false}
  validates :image_url,
			format: {with: %r{\.(gif|jpg|png)\Z}i,
					 message: 'Only .png, .jpg, .gif images are allowed'}
end
