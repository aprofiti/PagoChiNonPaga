require "rails_helper"

RSpec.describe SottocategorieController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sottocategorie").to route_to("sottocategorie#index")
    end

    it "routes to #new" do
      expect(:get => "/sottocategorie/new").to route_to("sottocategorie#new")
    end

    it "routes to #show" do
      expect(:get => "/sottocategorie/1").to route_to("sottocategorie#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sottocategorie/1/edit").to route_to("sottocategorie#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sottocategorie").to route_to("sottocategorie#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sottocategorie/1").to route_to("sottocategorie#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sottocategorie/1").to route_to("sottocategorie#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sottocategorie/1").to route_to("sottocategorie#destroy", :id => "1")
    end

  end
end
