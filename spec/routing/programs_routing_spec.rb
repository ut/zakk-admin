require "rails_helper"

RSpec.describe ProgramsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/programs").to route_to("programs#index")
    end

    it "routes to #show" do
      expect(:get => "/programs/1").to route_to("programs#show", :id => "1")
    end

  end
end
