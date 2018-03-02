require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :name => "MyString",
      :address => "MyText",
      :email => "MyString",
      :pay_type => 1
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[name]"

      assert_select "textarea[name=?]", "order[address]"

      assert_select "input[name=?]", "order[email]"

      assert_select "input[name=?]", "order[pay_type]"
    end
  end
end
