require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { is_expected.to have_many :line_items }

  describe '#add_product' do
    let(:cart) { create :cart }
    let(:product) { create :product }
    let!(:line_item) { create :line_item, cart: cart, product: product }
  
    context 'when we add existing product to the cart' do
      before do
        item = cart.add_product(product)
        item.save
      end
      
      it 'increments quantity' do
        expect(cart.line_items.first.quantity).to eq 2
      end
    end

    context 'when we add new product to the cart' do
      let(:product2) { create :product }
      let(:item) { cart.add_product(product2) }

      context 'builds new line item' do
        it { expect(item.new_record?).to be true }
        it { expect(item.quantity).to eq 1 }
        it { expect(item.product_id).to eq product2.id }
        it { expect(item.cart_id).to eq cart.id }
      end
    end
  end
end
