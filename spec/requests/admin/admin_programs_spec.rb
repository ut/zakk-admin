require 'rails_helper'

RSpec.describe "Admin::Programs", type: :request do
  describe "GET /admin_programs" do
    it "redirects for guests" do
      get admin_programs_path
      expect(response).to have_http_status(302)
    end
  end



  describe "Guests" do

    it "shows login form" do
      visit new_user_session_path
      click_button "Sign in"
    end

  end

  describe "Users" do
    before do
      @user = FactoryGirl.create(:user)
      # @user.save_without_session_maintenance
    end


    it "receives some content w/capybara", :js => false do
      visit "/admin/programs"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button 'Sign in'

    end

  end

end
