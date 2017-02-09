require "rails_helper"

RSpec.describe CarrelloController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/carrello/1").to route_to("carrello#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/carrello").to route_to("carrello#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/carrello/1").to route_to("carrello#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/carrello/1").to route_to("carrello#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/carrello/1").to route_to("carrello#destroy", :id => "1")
    end

  end
end
