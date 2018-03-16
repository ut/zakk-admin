require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "redirects for guests" do
      get events_path
      expect(response).to have_http_status(302)
    end
  end
end
