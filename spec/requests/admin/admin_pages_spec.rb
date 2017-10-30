require 'rails_helper'

RSpec.describe "Admin::Pages", type: :request do
  describe "GET /admin_pages" do
    it "redirects for guests" do
      get admin_pages_path
      expect(response).to have_http_status(302)
    end
  end

  describe "for signed in users" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @page = FactoryGirl.create(:page)
    end
    it "redirects for pages/show" do
      get admin_page_path(@page)
      expect(response).to redirect_to page_path(@page)
    end
  end
end
