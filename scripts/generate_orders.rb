# We can run this script via command:
#   $ rails runner scripts/generate_orders.rb

Order.transaction do
  pay_type = PayType.last

  (1..100).each do |i|
    Order.create name: "Kenny #{i}", address: "Some Street, #{i}",
                 email: "user#{i}@mail.ru", pay_type: pay_type
  end
end
