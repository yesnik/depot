require 'rails_helper'

RSpec.describe "users/show", type: :view do
  let(:user) { create :user }

  before do
    @user = assign(:user, user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{user.name}/)
  end
end
