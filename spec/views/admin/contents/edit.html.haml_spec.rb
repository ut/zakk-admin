require 'rails_helper'

RSpec.describe "admin/contents/edit", type: :view do
  before(:each) do
    @admin_content = assign(:admin_content, Content.create!(
      :title => "MyString",
      :text => "MyText",
      :published => false,
      :pos => 1,
      :col => 1,
      :page => '1'
    ))
  end

  it "renders the edit admin_content form" do
    render

    assert_select "form[action=?][method=?]", admin_content_path(@admin_content), "post" do

      assert_select "input#admin_content_title[name=?]", "admin_content[title]"

      assert_select "textarea#admin_content_text[name=?]", "admin_content[text]"

      assert_select "input#admin_content_published[name=?]", "admin_content[published]"

      assert_select "input#admin_content_pos[name=?]", "admin_content[pos]"

      assert_select "input#admin_content_col[name=?]", "admin_content[col]"

      assert_select "input#admin_content_page_id[name=?]", "admin_content[page_id]"
    end
  end
end
