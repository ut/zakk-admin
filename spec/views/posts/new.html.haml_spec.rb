require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :title => "MyString",
      :shortext => "MyText",
      :longtext => "MyText",
      :location_id => 1,
      :link => "MyString",
      :label => "MyString",
      :organizer => "MyString",
      :organizerlink => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_shortext[name=?]", "post[shortext]"

      assert_select "textarea#post_longtext[name=?]", "post[longtext]"

      assert_select "input#post_location_id[name=?]", "post[location_id]"

      assert_select "input#post_link[name=?]", "post[link]"

      assert_select "input#post_label[name=?]", "post[label]"

      assert_select "input#post_organizer[name=?]", "post[organizer]"

      assert_select "input#post_organizerlink[name=?]", "post[organizerlink]"
    end
  end
end
