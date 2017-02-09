require "rails_helper"

RSpec.describe ImpreseController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/imprese").to route_to("imprese#index")
    end

    it "routes to #new" do
      expect(:get => "/imprese/new").to route_to("imprese#new")
    end

    it "routes to #show" do
      expect(:get => "/imprese/CozzaFelice").to route_to("imprese#show", :nome => "CozzaFelice")
    end

    it "routes to #edit" do
      expect(:get => "/imprese/CozzaFelice/edit").to route_to("imprese#edit", :nome => "CozzaFelice")
    end

    it "routes to #create" do
      expect(:post => "/imprese").to route_to("imprese#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/imprese/CozzaFelice").to route_to("imprese#update", :nome => "CozzaFelice")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/imprese/CozzaFelice").to route_to("imprese#update", :nome => "CozzaFelice")
    end

    it "routes to #destroy" do
      expect(:delete => "/imprese/CozzaFelice").to route_to("imprese#destroy", :nome => "CozzaFelice")
    end

  end
end
