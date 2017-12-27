require 'rails_helper'

RSpec.describe "Admin::Posts" do

  describe "Guests" do

    it "shows login form", :js => false do
      visit "/admin/posts"
      expect(page).to have_content 'Sie müssen sich anmelden'
    end

  end

  describe "Users" do
    before do
      @user = FactoryGirl.create(:user_with_admin_role)
      @post = FactoryGirl.create(:post)
    end

    it "change status of a post from draft to published (with XHR)", :js => true do
      visit "/admin/posts"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button I18n.t('devise.sessions.new.sign_in')

      expect(page).to have_content I18n.t('devise.sessions.signed_in')
      expect(page).to have_current_path "/admin/posts"

      click_link("post_status_to_publish_"+@post.id.to_s)
      wait_for_ajax
      # save_and_open_page
      find("a#post_status_to_draft_"+@post.id.to_s).has_css?('post-status-anchor-active')
    end

  end

end
