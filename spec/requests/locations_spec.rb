require 'rails_helper'

RSpec.describe "Locations", type: :request do
  describe "GET /locations" do
    it "redirects for guests" do
      get locations_path
      expect(response).to have_http_status(302)
    end
  end
end
