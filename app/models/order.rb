class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "check", "credit_card", "cash" ]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
end
