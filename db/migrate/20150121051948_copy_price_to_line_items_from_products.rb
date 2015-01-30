class CopyPriceToLineItemsFromProducts < ActiveRecord::Migration
  def up
    # Для каждого LineItem ищем товар и записываем его цену
    LineItem.all.each do |line_item|
      product = Product.find(line_item.product_id)
      line_item.update_attributes(price: product.price)
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.update_attributes(price: nil)
    end
  end
end
