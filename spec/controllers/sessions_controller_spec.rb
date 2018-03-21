require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(302)
    end
  end

  it "should prompt for login" do
    get :new
    expect(response).to have_http_status(:success)
  end

  let(:user) { create :user, name: 'kenny', password: '123' }

  it "should login" do
    post :create, params: {name: user.name, password: user.password}
    assert_redirected_to admin_url
    assert_equal user.id, session[:user_id]
  end

  it "should fail login" do
    post :create, params: { name: user.name, password: 'wrong' }
    assert_redirected_to login_url
  end

  it "should logout" do
    delete :destroy
    assert_redirected_to store_index_url
  end

end
