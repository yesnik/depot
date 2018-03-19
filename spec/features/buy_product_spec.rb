require 'rails_helper'
require 'capybara/rspec'

feature 'Buying new product' do
  background do
    create :product 
  end

  scenario 'Add product to cart' do
    visit store_index_path
    click_button 'Add to Cart'
    
    expect(page).to have_button('Checkout')
  end

  scenario 'Click Checkout button' do
    visit store_index_path
    click_button 'Add to Cart'
    click_button 'Checkout'

    expect(page).to have_button('Place order')
  end

  let!(:pay_type) { create :pay_type }

  scenario 'Fill Order Details' do
    visit store_index_path
    click_button 'Add to Cart'
    click_button 'Checkout'

    within('.depot_form') do
      fill_in 'order[name]', with: 'Jonh Connor'
      fill_in 'order[address]', with: 'California, Great avenue, 1250, 20'
      fill_in 'order[email]', with: 'john@gmail.com'

      select pay_type.title, from: 'order[pay_type_id]'
    end
    click_button 'Place order'

    expect(page).to have_content 'Thank you for your order'
  end
end
