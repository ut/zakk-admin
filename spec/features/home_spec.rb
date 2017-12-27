require 'spec_helper'

describe 'visiting the homepage' do
  before do
    visit '/'
  end

  it 'should have a body' do
    expect(page).to have_css('body')
  end


  it "receives a js enabled message", :js => true do
    visit "/"
    # save_and_open_page
    expect(page).to have_css("html.js")
  end


end
