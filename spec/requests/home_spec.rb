require 'spec_helper'

describe 'visiting the homepage' do
  before do
    visit '/'
  end

  it 'should have a body' do
    page.should have_css('body')    
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
    
    it "receives a js enabled message", :js => true do
      visit root_path
      page.should have_content("Javascript enabled")
    end

    it "receives some content w/capybara", :js => true do
      visit "/"
      fill_in 'user_login', :with => @user.login
      fill_in 'user_password', :with => @user.password
      click_button 'Sign in'
      find('#main').should have_content("#{Settings.app_name}")

    end     
  
  end



end
