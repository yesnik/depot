# encoding: utf-8
require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
    @cart = carts(:one)
    @line_item.cart = @cart
  end

  test "requires item in cart" do
    get :new
    assert_redirected_to store_path
    assert_equal flash[:notice], I18n.t('activerecord.attributes.cart.messages.cart_is_empty')
  end

  test "should get new" do
    item = LineItem.new
    item.build_cart
    item.product = products(:ruby_book)
    item.save!
    session[:cart_id] = item.cart.id
    get :new
    assert_response :success
  end
end
