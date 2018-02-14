require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  describe "GET /line_items" do
    it "works! (now write some real specs)" do
      get line_items_path
      expect(response).to have_http_status(200)
    end
  end
end
