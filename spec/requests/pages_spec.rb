require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /pages" do
    it "does not exists" do
      expect{ get "/pages" }.to raise_error(ActionController::RoutingError)
    end
  end


end
