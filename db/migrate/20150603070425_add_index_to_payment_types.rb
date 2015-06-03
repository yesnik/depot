class AddIndexToPaymentTypes < ActiveRecord::Migration
  def change
    add_index :payment_types, :title, :unique => true
  end
end
