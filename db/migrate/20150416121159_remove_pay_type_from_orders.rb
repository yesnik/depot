class RemovePayTypeFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :pay_type, :string
  end
end
