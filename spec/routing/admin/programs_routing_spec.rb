require "rails_helper"

RSpec.describe Admin::ProgramsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/programs").to route_to("admin/programs#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/programs/new").to route_to("admin/programs#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/programs/1").to route_to("admin/programs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/programs/1/edit").to route_to("admin/programs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/programs").to route_to("admin/programs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/programs/1").to route_to("admin/programs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/programs/1").to route_to("admin/programs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/programs/1").to route_to("admin/programs#destroy", :id => "1")
    end

  end
end
