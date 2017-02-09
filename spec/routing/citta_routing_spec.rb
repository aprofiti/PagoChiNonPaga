require "rails_helper"

RSpec.describe CittaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/citta").to route_to("citta#index")
    end

    it "routes to #show" do
      expect(:get => "/citta/Palermo?id=1").to route_to("citta#show", :id => "1",:nome => "Palermo")
    end

    it "routes to #create" do
      expect(:post => "/citta").to route_to("citta#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/citta/Palermo?id=1").to route_to("citta#update", :id => "1",:nome => "Palermo")
    end

  end
end
