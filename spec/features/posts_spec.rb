require 'spec_helper'

describe 'visiting a post show view' do


  it 'does not show a drafted post view to guests' do
    @post = FactoryGirl.create(:post, :title => "Drafted Post", :startdate => DateTime.now + 2.days)
    visit "/posts/#{@post.id}"
    expect(page).to have_current_path "/"
    expect(page).to have_content "Post is not publically available"
  end

  it 'shows a published, future post view (event) to guests' do
    @post = FactoryGirl.create(:post, :title => "Published Post", :status => "Published", :startdate => DateTime.now + 2.days)
    visit "/posts/#{@post.id}"
    expect(page).to have_current_path "/posts/#{@post.id}"
    expect(page).to have_content('Published Post')
  end

end
