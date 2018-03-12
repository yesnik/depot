class AddPayTypeIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :pay_type, foreign_key: true
  end
end
