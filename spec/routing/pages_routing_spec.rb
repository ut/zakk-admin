require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do


    it "routes to #show" do
      expect(:get => "/pages/1").to route_to("pages#show", :id => "1")
    end

  end
end
