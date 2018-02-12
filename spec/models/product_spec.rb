require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :image_url }
  it { is_expected.to validate_presence_of :price }

  it do
  	is_expected.to validate_numericality_of(:price),
	    greater_than_or_equal_to: 0.01
  end
end
