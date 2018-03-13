require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  let(:order1) { create :order }
  let(:order2) { create :order }

  before(:each) do
    assign(:orders, [order1, order2])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => order1.name, :count => 1
    assert_select "tr>td", :text => order1.address, :count => 1
    assert_select "tr>td", :text => order1.email.to_s, :count => 1
    assert_select "tr>td", :text => order1.pay_type.title, :count => 2
  end
end
