require 'rails_helper'

RSpec.describe "Prodotti", type: :request do
  describe "GET /prodotti" do
    it "works! (now write some real specs)" do
      get prodotti_path
      expect(response).to have_http_status(200)
    end
  end
end
