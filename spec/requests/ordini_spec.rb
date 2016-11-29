require 'rails_helper'

RSpec.describe "Ordini", type: :request do
  describe "GET /ordini" do
    it "works! (now write some real specs)" do
      get ordini_path
      expect(response).to have_http_status(200)
    end
  end
end
