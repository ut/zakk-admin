require 'rails_helper'

RSpec.describe "Admin::Programs" do

  describe "Guests" do

    it "shows login form", :js => false do
      visit "/admin/programs"
      expect(page).to have_content 'Sie müssen sich anmelden'
    end

    it "shows error if login with wrong credentials", :js => false do
      visit '/admin/programs'
      fill_in 'user_login', with: 'nobody'
      fill_in 'user_password', with: 'abcdefghijklmn'
      click_button I18n.t('devise.sessions.new.sign_in')
      expect(page).to have_content 'Ungültige Anmeldedaten'
    end

  end

  describe "Users" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "login before accessing admin area", :js => false do
      visit "/admin/programs"
      expect(page).to have_current_path "/users/sign_in"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button I18n.t('devise.sessions.new.sign_in')
      expect(page).to have_content I18n.t('devise.sessions.signed_in')
    end

    it "logout", :js => false do
      visit "/admin/programs"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button  I18n.t('devise.sessions.new.sign_in')
      click_link('logout')
      expect(page).to have_content I18n.t('devise.sessions.signed_out')
    end


  end
end
