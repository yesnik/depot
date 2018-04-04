class ProductsLocaleAddNotNull < ActiveRecord::Migration[5.1]
  def up
    execute "UPDATE products SET locale = 'ru'"
    change_column_null :products, :locale, false
  end

  def down
    change_column_null :products, :locale, true
    execute "UPDATE products SET locale = NULL"
  end
end
