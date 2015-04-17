class PaymentType < ActiveRecord::Base
  has_many :orders
end
