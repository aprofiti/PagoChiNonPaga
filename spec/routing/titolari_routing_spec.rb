require "rails_helper"

RSpec.describe TitolariController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/titolari/new").to route_to("titolari#new")
    end

    it "routes to #show" do
      expect(:get => "/titolari/1").to route_to("titolari#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/titolari/1/edit").to route_to("titolari#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/titolari").to route_to("titolari#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/titolari/1").to route_to("titolari#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/titolari/1").to route_to("titolari#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/titolari/1").to route_to("titolari#destroy", :id => "1")
    end

  end
end
