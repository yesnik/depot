require 'rails_helper'

RSpec.describe Cart, :type => :model do
  it ".add_product(product_id)" do
    # TODO Завершить!
    pencil = Product.create!(title: "Pencil", price: 20.5)
    pencil.line_items.build(product_id: pencil.id)
    chelimsky = User.create!(first_name: "David", last_name: "Chelimsky")

    expect(User.ordered_by_last_name).to eq([chelimsky, lindeman])
  end
end
