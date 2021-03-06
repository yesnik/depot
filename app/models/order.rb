class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :pay_type

  validates :name, :address, :email, :pay_type, presence: true

  encrypt :name, :email

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
