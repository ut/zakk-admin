require 'rails_helper'

RSpec.describe "Admin::Programs", type: :request do
  describe "GET /admin_programs" do
    it "redirects for guests" do
      get admin_programs_path
      expect(response).to have_http_status(302)
    end
  end

end
