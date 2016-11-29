require 'rails_helper'

RSpec.describe "Utenti", type: :request do
  describe "GET /utenti" do
    it "works! (now write some real specs)" do
      get utenti_path
      expect(response).to have_http_status(200)
    end
  end
end
