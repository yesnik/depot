require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #index" do
    before { sign_in }

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
