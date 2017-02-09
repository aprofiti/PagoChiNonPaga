require "rails_helper"

RSpec.describe CategorieController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/categorie").to route_to("categorie#index")
    end

    it "routes to #create" do
      expect(:post => "/categorie").to route_to("categorie#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/categorie/Alimentari").to route_to("categorie#update", :nome => "Alimentari")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/categorie/Alimentari").to route_to("categorie#update", :nome => "Alimentari")
    end

    it "routes to #destroy" do
      expect(:delete => "/categorie/Alimentari").to route_to("categorie#destroy", :nome => "Alimentari")
    end

  end
end
