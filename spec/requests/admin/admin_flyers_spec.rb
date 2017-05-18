require 'rails_helper'

RSpec.describe "Admin::Flyers", type: :request do
  describe "GET /admin_flyers" do
    it "redirects for guests" do
      get admin_flyers_path
      expect(response).to have_http_status(302)
    end
  end
end
