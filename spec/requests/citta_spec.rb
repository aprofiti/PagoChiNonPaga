require 'rails_helper'

RSpec.describe "Citta", type: :request do
  describe "GET /citta" do
    it "works! (now write some real specs)" do
      get citta_index_path
      expect(response).to have_http_status(200)
    end
  end
end
