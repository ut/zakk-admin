require 'rails_helper'

RSpec.describe "admin/pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", admin_page_path(@page), "post" do

      assert_select "input#page_title[name=?]", "page[title]"

      assert_select "input#page_description[name=?]", "page[description]"

      assert_select "input#page_published[name=?]", "page[published]"

      assert_select "input#page_in_menu[name=?]", "page[in_menu]"
    end
  end
end
