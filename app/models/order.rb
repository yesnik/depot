class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "check", "credit_card", "cash" ]

  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      #Присвоим свойству cart_id значение nil, чтобы товарная позиция не исчезла при удалении корзины
      item.cart_id = nil
      #товарную позицию мы добавим к коллекции line_items для заказа
      line_items << item
    end
  end
end
