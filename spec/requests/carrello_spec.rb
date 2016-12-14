require 'rails_helper'

RSpec.describe "Carrello", type: :request do
  describe "GET /carrello" do
    it "works! (now write some real specs)" do
      get carrello_index_path
      expect(response).to have_http_status(200)
    end
  end
end
