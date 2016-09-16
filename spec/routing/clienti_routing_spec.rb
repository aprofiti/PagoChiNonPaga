require "rails_helper"

RSpec.describe ClientiController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/clienti").to route_to("clienti#index")
    end

    it "routes to #new" do
      expect(:get => "/clienti/new").to route_to("clienti#new")
    end

    it "routes to #show" do
      expect(:get => "/clienti/1").to route_to("clienti#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/clienti/1/edit").to route_to("clienti#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/clienti").to route_to("clienti#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clienti/1").to route_to("clienti#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clienti/1").to route_to("clienti#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clienti/1").to route_to("clienti#destroy", :id => "1")
    end

  end
end
