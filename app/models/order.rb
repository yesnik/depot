class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  belongs_to :payment_type

  validates :name, :address, :email, :payment_type, presence: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      #Присвоим свойству cart_id значение nil, чтобы товарная позиция не исчезла при удалении корзины
      item.cart_id = nil
      #товарную позицию мы добавим к коллекции line_items для заказа
      line_items << item
    end
  end
end
