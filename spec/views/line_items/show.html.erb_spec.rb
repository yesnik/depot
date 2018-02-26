require 'rails_helper'

RSpec.describe "line_items/show", type: :view do
  let(:product) { create :product, title: 'My book' }
  let(:line_item) { create :line_item, product: product }
  let(:cart) { line_item.cart }

  before(:each) do
    @line_item = assign(:line_item, line_item)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/My book/)
    expect(rendered).to match(/#{cart.id}/)
  end
end
