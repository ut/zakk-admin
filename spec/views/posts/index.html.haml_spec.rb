require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :shortext => "MyText",
        :longtext => "MyText",
        :location_id => 1,
        :link => "Link",
        :label => "Label",
        :organizer => "Organizer",
        :organizerlink => "Organizerlink"
      ),
      Post.create!(
        :title => "Title",
        :shortext => "MyText",
        :longtext => "MyText",
        :location_id => 1,
        :link => "Link",
        :label => "Label",
        :organizer => "Organizer",
        :organizerlink => "Organizerlink"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Organizer".to_s, :count => 2
    assert_select "tr>td", :text => "Organizerlink".to_s, :count => 2
  end
end
