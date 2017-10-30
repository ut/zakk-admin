require 'rails_helper'

RSpec.describe "Admin::Contents", type: :request do
  describe "GET /admin_contents" do
    it "redirects for guests" do
      get admin_contents_path
      expect(response).to have_http_status(302)
    end
  end


  describe "for signed in users" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @content = FactoryGirl.create(:content)
    end
    it "redirects for contents/show" do
      get admin_content_path(@content)
      expect(response).to redirect_to page_path(@content.page)
    end
  end

end
