require "rails_helper"

RSpec.describe SottocategoriaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sottocategoria").to route_to("sottocategoria#index")
    end

    it "routes to #new" do
      expect(:get => "/sottocategoria/new").to route_to("sottocategoria#new")
    end

    it "routes to #show" do
      expect(:get => "/sottocategoria/1").to route_to("sottocategoria#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sottocategoria/1/edit").to route_to("sottocategoria#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sottocategoria").to route_to("sottocategoria#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sottocategoria/1").to route_to("sottocategoria#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sottocategoria/1").to route_to("sottocategoria#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sottocategoria/1").to route_to("sottocategoria#destroy", :id => "1")
    end

  end
end
