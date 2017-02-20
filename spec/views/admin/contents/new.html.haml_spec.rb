require 'rails_helper'

RSpec.describe "admin/contents/new", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "MyString",
      :description => "MyString"
    ))

    @content = assign(:content, Content.new(
      :title => "MyString",
      :text => "MyText",
      :published => false,
      :pos => 1,
      :col => 1,
      :page => @page
    ))
  end

  it "renders new content form" do
    render

    assert_select "form[action=?][method=?]", admin_contents_path, "post" do

      assert_select "input#content_title[name=?]", "content[title]"

      assert_select "textarea#content_text[name=?]", "content[text]"

      assert_select "input#content_published[name=?]", "content[published]"
    end
  end
end
