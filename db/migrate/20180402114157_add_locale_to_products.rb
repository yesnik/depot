class AddLocaleToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :locale, :string, limit: 3, index: true
  end
end
