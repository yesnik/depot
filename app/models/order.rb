# encoding: utf-8
class Order < ActiveRecord::Base
  include Loggable
  
  encrypt(:name, :email)

  has_many :line_items, dependent: :destroy
  belongs_to :payment_type

  validates :name, :address, :email, :payment_type, presence: true
  validates :phone, length: {minimum: 6, maximum: 20}
  scope :checks, -> { joins(:payment_type).where(payment_types: {title: 'check'}) }

  before_validation :normalize_phone
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      #Присвоим свойству cart_id значение nil, чтобы товарная позиция не исчезла при удалении корзины
      item.cart_id = nil
      #товарную позицию мы добавим к коллекции line_items для заказа
      line_items << item
    end
  end

  protected
  
  def normalize_phone
    self.phone.gsub!(/[-\s\(\)]/, '') if phone
  end

  def after_find; end
end
