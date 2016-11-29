require 'rails_helper'

RSpec.describe "Titolari", type: :request do
  describe "GET /titolari" do
    it "works! (now write some real specs)" do
      get titolari_path
      expect(response).to have_http_status(200)
    end
  end
end
