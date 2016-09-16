require "rails_helper"

RSpec.describe CittaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/citta").to route_to("citta#index")
    end

    it "routes to #new" do
      expect(:get => "/citta/new").to route_to("citta#new")
    end

    it "routes to #show" do
      expect(:get => "/citta/1").to route_to("citta#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/citta/1/edit").to route_to("citta#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/citta").to route_to("citta#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/citta/1").to route_to("citta#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/citta/1").to route_to("citta#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/citta/1").to route_to("citta#destroy", :id => "1")
    end

  end
end
