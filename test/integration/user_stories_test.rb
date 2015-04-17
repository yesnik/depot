# encoding: utf-8
require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  # A user goes to the index page. They select a product, adding it to their
  # cart, and check out, filling in their details on the checkout form. When
  # they submit, an order is created containing their information, along with a
  # single line item corresponding to the product they added to their cart.

  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby_book)

    # Пользователь заходит на страницу каталога магазина
    get "/"
    assert_response :success
    assert_template "index"

    # Он выбирает товар, добавляя его в свою корзину
    xml_http_request :post, '/line_items', product_id: ruby_book.id
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal ruby_book, cart.line_items[0].product

    # Затем он оформляет заказ..
    get "/orders/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/orders",
                      order: { name:     "Dave Thomas",
                               address:  "123 The Street",
                               email:    "dave@example.com",
                               payment_type_id: 1 }
    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    # Проверим, что теперь в корзине содержится только наш новый заказ
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal "Dave Thomas",      order.name
    assert_equal "123 The Street",   order.address
    assert_equal "dave@example.com", order.email
    assert_equal 1,            order.payment_type.id

    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal ruby_book, line_item.product

    # проверим, что само почтовое отправление правильно адресовано и имеет ожидаемую нами строку темы
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["dave@example.com"], mail.to
    assert_equal 'depot@example.com', mail[:from].value
    assert_equal "Подтверждение заказа в Pragmatic Store", mail.subject
  end
end
