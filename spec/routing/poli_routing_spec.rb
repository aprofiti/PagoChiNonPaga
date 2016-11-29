require "rails_helper"

RSpec.describe PoliController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/poli").to route_to("poli#index")
    end

    it "routes to #new" do
      expect(:get => "/poli/new").to route_to("poli#new")
    end

    it "routes to #show" do
      expect(:get => "/poli/1").to route_to("poli#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/poli/1/edit").to route_to("poli#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/poli").to route_to("poli#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/poli/1").to route_to("poli#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/poli/1").to route_to("poli#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/poli/1").to route_to("poli#destroy", :id => "1")
    end

  end
end
