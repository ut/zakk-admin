require 'rails_helper'

RSpec.describe "Admin::Events" do

  describe "Guests" do

    it "shows login form", :js => false do
      visit "/admin/events"
      expect(page).to have_content 'Sie müssen sich anmelden'
    end

  end

  describe "Users" do
    before do
      @user = FactoryBot.create(:user_with_admin_role)
      @event = FactoryBot.create(:event)
    end

    context "change status of a event (with XHR)" do

      it "... from draft to published", :js => true do
        visit "/users/sign_in"
        save_and_open_page
        fill_in 'user_login', :with => @user.login
        fill_in 'user_password', :with => @user.password
        click_button I18n.t('devise.sessions.new.sign_in')

        expect(page).to have_content I18n.t('devise.sessions.signed_in')
        expect(page).to have_current_path "/"
        visit "/admin/events"

        click_link("event_status_to_publish_"+@event.id.to_s)
        wait_for_ajax
        find("a#event_status_to_draft_"+@event.id.to_s).has_css?('event-status-anchor-active')
      end
    end
  end

end
