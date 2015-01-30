require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # Тестируем работу метода add_product
  test '#add_product adds product to cart' do
    product = products(:ruby_book)
    cart = carts(:one)
    cart.add_product(product.id)
    line_item = cart.line_items.first
    assert_equal line_item.product.title, 'Programming Ruby 1.9'
  end

  test '#total_price calculate correct sum' do
    cart = carts(:one)
    p1 = products(:history)
    p2 = products(:biology)

    cart.add_product(p1.id)
    cart.add_product(p2.id)
    
    assert_equal cart.total_price, p1.price + p2.price
  end
end
