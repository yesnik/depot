require 'rails_helper'

RSpec.describe "line_items/index", type: :view do
  let(:product1) { create :product, title: 'My book 1' }
  let(:product2) { create :product, title: 'My book 2' }

  let(:line_item1) { create :line_item, product: product1, quantity: 1 }
  let(:line_item2) { create :line_item, product: product2, quantity: 3 }

  before(:each) do
    assign(:line_items, [line_item1, line_item2])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr > td", :text => 'My book 1'
    assert_select "tr > td", :text => 'My book 2'
  end
end
