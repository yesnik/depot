require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let(:login_params) { {name: 'johny', password: '123'} }
  let(:login_params_invalid) { {name: 'johny', password: '111'} }
  before do
    User.create(login_params)
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe ".create" do
    it "login user if credentials correct" do
      post :create, login_params
      expect(response).to redirect_to admin_url
    end

    it "does not login user if credentials incorrect" do
      post :create, login_params_invalid
      expect(response).to redirect_to login_url
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to redirect_to store_url
    end
  end
end
