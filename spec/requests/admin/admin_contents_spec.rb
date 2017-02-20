require 'rails_helper'

RSpec.describe "Admin::Contents", type: :request do
  describe "GET /admin_contents" do
    it "works! (now write some real specs)" do
      get admin_contents_path
      expect(response).to have_http_status(302)
    end
  end
end
