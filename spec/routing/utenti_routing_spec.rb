require "rails_helper"

RSpec.describe UtentiController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/utenti").to route_to("utenti#index")
    end

    it "routes to #new" do
      expect(:get => "/utenti/new").to route_to("utenti#new")
    end

    it "routes to #show" do
      expect(:get => "/utenti/1").to route_to("utenti#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/utenti/1/edit").to route_to("utenti#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/utenti").to route_to("utenti#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/utenti/1").to route_to("utenti#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/utenti/1").to route_to("utenti#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/utenti/1").to route_to("utenti#destroy", :id => "1")
    end

  end
end
