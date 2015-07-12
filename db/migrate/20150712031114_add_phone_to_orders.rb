class AddPhoneToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone, :string, limit: 20
  end
end
