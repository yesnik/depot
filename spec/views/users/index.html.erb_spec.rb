require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:user1) { create :user, name: 'leo' }
  let(:user2) { create :user, name: 'kenny' }
  
  before(:each) do
    assign(:users, [user1, user2])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => user1.name
    assert_select "tr>td", :text => user2.name
  end
end
