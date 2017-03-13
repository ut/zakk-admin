require 'rails_helper'

RSpec.describe "Admin::Flyers", type: :request do
  describe "GET /admin_flyers" do
    it "works! (now write some real specs)" do
      get admin_flyers_path
      expect(response).to have_http_status(200)
    end
  end
end
