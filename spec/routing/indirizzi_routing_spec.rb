require "rails_helper"

RSpec.describe IndirizziController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/indirizzi").to route_to("indirizzi#index")
    end

    it "routes to #new" do
      expect(:get => "/indirizzi/new").to route_to("indirizzi#new")
    end

    it "routes to #show" do
      expect(:get => "/indirizzi/1").to route_to("indirizzi#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/indirizzi/1/edit").to route_to("indirizzi#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/indirizzi").to route_to("indirizzi#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/indirizzi/1").to route_to("indirizzi#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/indirizzi/1").to route_to("indirizzi#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/indirizzi/1").to route_to("indirizzi#destroy", :id => "1")
    end

  end
end
