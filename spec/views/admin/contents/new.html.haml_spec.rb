require 'rails_helper'

RSpec.describe "admin/contents/new", type: :view do
  before(:each) do
    assign(:admin_content, Content.new(
      :title => "MyString",
      :text => "MyText",
      :published => false,
      :pos => 1,
      :col => 1,
      :page => nil
    ))
  end

  it "renders new admin_content form" do
    render

    assert_select "form[action=?][method=?]", contents_path, "post" do

      assert_select "input#admin_content_title[name=?]", "admin_content[title]"

      assert_select "textarea#admin_content_text[name=?]", "admin_content[text]"

      assert_select "input#admin_content_published[name=?]", "admin_content[published]"

      assert_select "input#admin_content_pos[name=?]", "admin_content[pos]"

      assert_select "input#admin_content_col[name=?]", "admin_content[col]"

      assert_select "input#admin_content_page_id[name=?]", "admin_content[page_id]"
    end
  end
end
