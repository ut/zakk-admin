require "rails_helper"

RSpec.describe Admin::FlyersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/flyers").to route_to("admin/flyers#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/flyers/new").to route_to("admin/flyers#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/flyers/1").to route_to("admin/flyers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/flyers/1/edit").to route_to("admin/flyers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/flyers").to route_to("admin/flyers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/flyers/1").to route_to("admin/flyers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/flyers/1").to route_to("admin/flyers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/flyers/1").to route_to("admin/flyers#destroy", :id => "1")
    end

  end
end
