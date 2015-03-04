require 'rails_helper'

RSpec.describe CartsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the carts into @carts" do
      Cart.delete_all
      cart1, cart2 = Cart.create!, Cart.create!
      get :index
      expect(assigns(:carts)).to match_array([cart1, cart2])
    end
  end


end
