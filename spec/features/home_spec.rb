require 'spec_helper'

describe 'visiting the homepage' do

  describe "Guests" do

    before do
      Page.destroy_all
      visit '/'
    end

    it 'should have a body' do
      expect(page).to have_css('body')
    end

    it "receives a js enabled message (css class set by modernizr", :js => true do
      expect(page).to have_css("html.js")
    end

    it 'does not show a drafted post to guests' do
      @post = FactoryBot.create(:post, :title => "Drafted Post", :startdate => DateTime.now + 2.days)
      visit '/'
      expect(page).not_to have_css('div.post_draft')
      expect(page).not_to have_content('Drafted Post')
    end

    it 'shows a published, future post (event) to guests' do
      @post = FactoryBot.create(:post, :title => "Published Post", :status => "Published", :startdate => DateTime.now + 2.days)
      visit '/'
      expect(page).to have_css('div.post_published')
      expect(page).to have_content('Published Post')
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

  describe "Users" do
    before do
      Post.destroy_all
      @user = FactoryBot.create(:user_with_user_role)
      visit "/users/sign_in"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button I18n.t('devise.sessions.new.sign_in')
    end


    it 'shows a published, future post (event) to users also' do
      @post = FactoryBot.create(:post, :title => "Published Post", :status => "Published", :startdate => DateTime.now + 2.days)
      visit '/'
      expect(page).to have_css('div.post_published')
      expect(page).to have_content('Published Post')
    end


    it 'does show a drafted post to users only (with edit button)' do
      @post = FactoryBot.create(:post, :title => "Drafted Post",:startdate => DateTime.now + 2.days, :ptype => '1')
      visit '/'
      expect(page).to have_css('div.post_draft')
      expect(page).to have_content('Drafted Post')
      within('div.post_draft') {
        expect(page).to have_css('div.post-switch')
        expect(page).to have_css('div.post-switch a.post-edit')
      }
    end



  end

end
