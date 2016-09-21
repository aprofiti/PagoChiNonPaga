require 'rails_helper'

RSpec.describe "Poli", type: :request do
  describe "GET /poli" do
    it "works! (now write some real specs)" do
      get poli_path
      expect(response).to have_http_status(200)
    end
  end
end
