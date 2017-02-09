require "rails_helper"

RSpec.describe PoliController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/poli").to route_to("poli#index")
    end

    it "routes to #show" do
      expect(:get => "/poli/Palermo").to route_to("poli#show", :nome => "Palermo")
    end

    it "routes to #create" do
      expect(:post => "/poli").to route_to("poli#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/poli/Palermo").to route_to("poli#update", :nome => "Palermo")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/poli/Palermo").to route_to("poli#update", :nome => "Palermo")
    end

    it "routes to #destroy" do
      expect(:delete => "/poli/Palermo").to route_to("poli#destroy", :nome => "Palermo")
    end

  end
end
