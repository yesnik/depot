class AddLocaleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :locale, :string, limit: 4, default: :ru
  end
end
