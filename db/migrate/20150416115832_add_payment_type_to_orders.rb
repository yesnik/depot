class AddPaymentTypeToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :payment_type, index: true
  end
end
