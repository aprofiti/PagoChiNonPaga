require 'rails_helper'

RSpec.describe "Sottocategorie", type: :request do
  describe "GET /sottocategorie" do
    it "works! (now write some real specs)" do
      get sottocategorie_path
      expect(response).to have_http_status(200)
    end
  end
end
