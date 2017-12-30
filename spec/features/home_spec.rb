require 'spec_helper'

describe 'visiting the homepage' do
  before do
    visit '/'
  end

  it 'should have a body' do
    expect(page).to have_css('body')
  end

  it "receives a js enabled message (css class set by modernizr", :js => true do
    expect(page).to have_css("html.js")
  end

  it 'does not show a drafted post to guests' do
    @post = FactoryGirl.create(:post, :title => "Drafted Post", :startdate => DateTime.now + 2.days)
    visit '/'
    expect(page).not_to have_css('div.post_draft')
    expect(page).not_to have_content('Drafted Post')
  end

  it 'shows a published, future post (event) to guests' do
    @post = FactoryGirl.create(:post, :title => "Published Post", :status => "Published", :startdate => DateTime.now + 2.days)
    visit '/'
    expect(page).to have_css('div.post_published')
    expect(page).to have_content('Published Post')
  end

end
