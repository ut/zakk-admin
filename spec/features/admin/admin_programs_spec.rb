require 'rails_helper'

RSpec.describe "Admin::Programs" do

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
