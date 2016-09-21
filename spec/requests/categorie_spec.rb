require 'rails_helper'

RSpec.describe "Categorie", type: :request do
  describe "GET /categorie" do
    it "works! (now write some real specs)" do
      get categorie_path
      expect(response).to have_http_status(200)
    end
  end
end
