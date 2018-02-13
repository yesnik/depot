require 'rails_helper'

RSpec.describe "store/index.html.erb", type: :view do
  it 'displays menu links' do
    assign(:products, [])
    render
    expect(rendered).to have_content 'Your Pragmatic Catalog'
  end
end
