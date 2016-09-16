require 'rails_helper'

RSpec.describe "Imprese", type: :request do
  describe "GET /imprese" do
    it "works! (now write some real specs)" do
      get imprese_path
      expect(response).to have_http_status(200)
    end
  end
end
