require 'rails_helper'

RSpec.describe Product, type: :model do
  # Relations
  it { is_expected.to have_many :line_items }
  
  # Validations
  it do
  	is_expected.to validate_length_of(:title).is_at_least(5).
  		with_message('Title length should be minimum 5 characters')
  end

  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :image_url }
  it { is_expected.to validate_presence_of :price }

  it do
  	is_expected.to validate_numericality_of(:price).
	    is_greater_than_or_equal_to(0.01)
  end

  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }

  it { is_expected.to allow_value('hi.jpg').for(:image_url) }
  it { is_expected.to allow_value('hi.png').for(:image_url) }
  it { is_expected.to allow_value('hi.gif').for(:image_url) }
  it { is_expected.to allow_value('hi.GiF').for(:image_url) }
  it do
  	is_expected.not_to allow_value('hi.mp4').for(:image_url).
      with_message('Only .png, .jpg, .gif images are allowed')
  end
end
