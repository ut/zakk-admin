require 'spec_helper'

describe 'visiting a page show view' do

  describe "Guests" do

    it 'does not show a drafted page  to guests' do
      @page = FactoryBot.create(:page, :title => "Drafted Page")
      visit "/pages/#{@page.id}"
      expect(page).to have_current_path "/"
      expect(page).to have_content "Post is not publically available"
    end

    it 'shows a published page to guests' do
      @page = FactoryBot.create(:page, :title => "Published Page", :published => true)
      visit "/pages/#{@page.id}"
      expect(page).to have_current_path "/pages/#{@page.id}"
      expect(page).to have_content('Published Page')
    end
  end

  describe "Users" do
    before do
      Page.destroy_all
      @user = FactoryBot.create(:user_with_user_role)
      visit "/users/sign_in"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button I18n.t('devise.sessions.new.sign_in')
    end

    it 'shows a published page to users (without edit button)' do
      @page = FactoryBot.create(:page, :title => "Published Page", :published => true)
      visit "/pages/#{@page.id}"
      expect(page).to have_current_path "/pages/#{@page.id}"
      expect(page).to have_content('Published Page')
      within('h1') {
        expect(page).not_to have_css('i.fi-pencil')
      }
    end

    it 'does show a drafted page to users (without edit button)' do
      @page = FactoryBot.create(:page, :title => "Drafted Page")
      visit "/pages/#{@page.id}"
      expect(page).to have_current_path "/pages/#{@page.id}"
      expect(page).to have_content('Drafted Page')
      within('h1') {
        expect(page).not_to have_css('i.fi-pencil')
      }
    end
  end

  describe "Admins" do
    before do
      Page.destroy_all
      @user = FactoryBot.create(:user_with_admin_role)
      visit "/users/sign_in"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button I18n.t('devise.sessions.new.sign_in')
    end

    it 'shows a published page to admins (with edit button)' do
      @page = FactoryBot.create(:page, :title => "Published Page", :published => true)
      visit "/pages/#{@page.id}"
      expect(page).to have_current_path "/pages/#{@page.id}"
      expect(page).to have_content('Published Page')
      within('h1') {
        expect(page).to have_css('i.fi-pencil')
      }
    end

    it 'does show a drafted page to admins (with edit button)' do
      @page = FactoryBot.create(:page, :title => "Drafted Page")
      visit "/pages/#{@page.id}"
      expect(page).to have_current_path "/pages/#{@page.id}"
      expect(page).to have_content('Drafted Page')
      within('h1') {
        expect(page).to have_css('i.fi-pencil')
      }
    end
  end
end
