require "rails_helper"

RSpec.describe OrdiniController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mieiOrdini").to route_to("ordini#index")
    end

    it "routes to #show" do
      expect(:get => "/mieiOrdini/1").to route_to("ordini#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mieiOrdini/1/edit").to route_to("ordini#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mieiOrdini").to route_to("ordini#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mieiOrdini/1").to route_to("ordini#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mieiOrdini/1").to route_to("ordini#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mieiOrdini/1").to route_to("ordini#destroy", :id => "1")
    end

  end
end
