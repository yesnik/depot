require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe LineItemsController, type: :controller do
  let!(:product) { create :product, title: 'Ruby book' }
  let!(:cart) { create :cart }

  # This should return the minimal set of attributes required to create a valid
  # LineItem. As you add validations to LineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {product_id: product.id, cart_id: cart.id}
  }

  let(:invalid_attributes) {
    {product_id: 111, cart_id: 555}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    let!(:line_item) { create :line_item }

    before { sign_in }

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    let!(:line_item) { create :line_item }

    before { sign_in }

    it "returns a success response" do
      get :show, params: {id: line_item.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    before { sign_in }

    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    before { sign_in }

    it "returns a success response" do
      line_item = LineItem.create! valid_attributes
      get :edit, params: {id: line_item.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { {product_id: product.id} }
    context "with valid params" do
      it "creates a new LineItem via ajax" do
        expect {
          post :create, params: valid_attributes,
            session: valid_session,
            xhr: true
        }.to change(LineItem, :count).by(1)
      end

      it "redirects to the created line_item" do
        post :create, params: valid_attributes, session: valid_session
        expect(response).to redirect_to store_index_url
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      before { sign_in }

      let(:product2) { create :product }

      let(:new_attributes) {
        {product_id: product2.id, cart_id: cart.id}
      }

      let(:line_item) { create :line_item }

      it "updates the requested line_item" do
        put :update, params: {id: line_item.to_param, line_item: new_attributes}, session: valid_session
        line_item.reload
        expect(line_item.product_id).to eq product2.id
      end

      it "redirects to the line_item" do
        put :update, params: {id: line_item.to_param, line_item: valid_attributes}, session: valid_session
        expect(response).to redirect_to(line_item)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:line_item) { create :line_item }

    before { sign_in }

    it "destroys the requested line_item" do
      expect {
        delete :destroy, params: {id: line_item.to_param}, session: valid_session
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      line_item = LineItem.create! valid_attributes
      delete :destroy, params: {id: line_item.to_param}, session: valid_session
      expect(response).to redirect_to(store_index_url)
    end
  end

end
