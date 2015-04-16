class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "check", "credit_card", "cash" ]
end
