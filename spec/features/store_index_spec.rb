require 'rails_helper'
require 'capybara/rspec'

feature 'User sees links' do
  before { visit store_index_path }

  it 'sees Home link' do
    expect(page).to have_content 'Home'
  end

  it 'has 4 links at least' do
    expect(page).to have_selector('#side li')
  end
end
