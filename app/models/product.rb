# encoding: utf-8

class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: {message: 'не может быть пустым'}
  validates :title, length: { minimum: 4, message: 'должен быть минимум 4 символа' }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: { with: /\.(gif|jpg|png)\z/i,
    message: "Изображение должно иметь расширение gif, jpg или png." }
end
