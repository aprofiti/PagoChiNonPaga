require "rails_helper"

RSpec.describe OrdiniController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ordini").to route_to("ordini#index")
    end

    it "routes to #new" do
      expect(:get => "/ordini/new").to route_to("ordini#new")
    end

    it "routes to #show" do
      expect(:get => "/ordini/1").to route_to("ordini#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ordini/1/edit").to route_to("ordini#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ordini").to route_to("ordini#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ordini/1").to route_to("ordini#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ordini/1").to route_to("ordini#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ordini/1").to route_to("ordini#destroy", :id => "1")
    end

  end
end
