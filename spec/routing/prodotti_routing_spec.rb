require "rails_helper"

RSpec.describe ProdottiController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prodotti").to route_to("prodotti#index")
    end

    it "routes to #new" do
      expect(:get => "/prodotti/new").to route_to("prodotti#new")
    end

    it "routes to #show" do
      expect(:get => "/prodotti/1").to route_to("prodotti#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prodotti/1/edit").to route_to("prodotti#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prodotti").to route_to("prodotti#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/prodotti/1").to route_to("prodotti#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/prodotti/1").to route_to("prodotti#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prodotti/1").to route_to("prodotti#destroy", :id => "1")
    end

  end
end
