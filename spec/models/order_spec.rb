require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'relations' do
    it { is_expected.to have_many :line_items }
    it { is_expected.to belong_to :pay_type }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :email }

    describe '#pay_type' do
      let(:order) { build :order }

      it do
        expect { order.pay_type = 'some value' }.
          to raise_error ArgumentError
      end
    end
  end
end
