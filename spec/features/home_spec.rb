# frozen_string_literal: true

require 'spec_helper'

describe 'visiting the homepage' do
  describe 'by guests:' do
    before do
      Program.destroy_all
      Page.destroy_all
      visit '/'
    end

    it 'should have a body' do
      expect(page).to have_css('body')
    end

    it 'receives a js enabled message (css class set by modernizr.js)', :js => true do
      expect(page).to have_css('html.js')
    end

    it 'displays programm image if defined' do
      @program = FactoryBot.create(:program, :current => true,
      :published => true)
      visit '/'
      expect(page).to have_css('div.panel.program_image')
    end

    it 'displays image credit if defined' do
      @program = FactoryBot.create(:program, :current => true,
      :published => true)
      visit '/'
      expect(page).to have_content("Maxi (cc-by-sa)")
    end

    it 'does not show a drafted event to guests' do
      @event = FactoryBot.create(:event, :title => "Drafted Event", :startdate => DateTime.now + 2.days)
      visit '/'
      expect(page).not_to have_css('div.event_draft')
      expect(page).not_to have_content('Drafted Event')
    end

    it 'shows a published, future event (event) to guests' do
      @event = FactoryBot.create(:event, :title => "Published Event", :status => "Published", :startdate => DateTime.now + 2.days)
      visit '/'
      expect(page).to have_css('div.event_published')
      expect(page).to have_content('Published Event')
    end

    it 'shows a menu with a published page to guests' do
      @page = FactoryBot.create(:page, :title => "Published Page", :published => true, :in_menu => true)
      visit '/'
      expect(page).to have_css('p.nav')
      expect(page).to have_content('Published Page')
    end

    it 'shows not a menu with an unpublished page to guests' do
      @page = FactoryBot.create(:page, :title => "Unpublished Page", :published => false, :in_menu => true)
      visit '/'
      expect(page).not_to have_css('p.nav')
      expect(page).not_to have_content('Unpublished Page')
    end

    it 'shows not a menu with an published, but "not in menu" page to guests' do
      @page = FactoryBot.create(:page, :title => "Unpublished Page", :published => true, :in_menu => false)
      visit '/'
      expect(page).not_to have_css('p.nav')
      expect(page).not_to have_content('Unpublished Page')
    end
  end

  describe 'by signed-in users:' do
    before do
      Event.destroy_all
      @user = FactoryBot.create(:user_with_user_role)
      visit '/users/sign_in'
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button I18n.t('devise.sessions.new.sign_in')
    end

    it 'shows a published, future event (event) to users also' do
      @event = FactoryBot.create(:event, :title => "Published Event", :status => "Published", :startdate => DateTime.now + 2.days)
      visit '/'
      expect(page).to have_css('div.event_published')
      expect(page).to have_content('Published Event')
    end

    xit 'does show a drafted event to authed users only (with edit button)' do
      @event = FactoryBot.create(:event, :title => "Drafted Event",:startdate => DateTime.now + 2.days, :ptype => '1')
      visit '/'
      expect(page).to have_css('div.event_draft')
      expect(page).to have_content('Drafted Event')
      within('div.event_draft') {
        expect(page).to have_css('div.event-switch')
        expect(page).to have_css('div.event-switch a.event-edit')
      }
    end
  end
end
