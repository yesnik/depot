class AddLocaleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :locale, :string, limit: 2, default: :ru
    add_index :products, :locale
  end
end
