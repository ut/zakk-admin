require 'rails_helper'

RSpec.describe "admin/pages/new", type: :view do
  before(:each) do
    assign(:admin_page, Page.new(
      :title => "MyString",
      :description => "MyString",
      :published => false,
      :in_menu => false
    ))
  end

  it "renders new admin_page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input#admin_page_title[name=?]", "admin_page[title]"

      assert_select "input#admin_page_description[name=?]", "admin_page[description]"

      assert_select "input#admin_page_published[name=?]", "admin_page[published]"

      assert_select "input#admin_page_in_menu[name=?]", "admin_page[in_menu]"
    end
  end
end
