require 'rails_helper'

RSpec.describe "admin/pages/edit", type: :view do
  before(:each) do
    @admin_page = assign(:admin_page, Page.create!(
      :title => "MyString",
      :description => "MyString",
      :published => false,
      :in_menu => false
    ))
  end

  it "renders the edit admin_page form" do
    render

    assert_select "form[action=?][method=?]", admin_page_path(@admin_page), "post" do

      assert_select "input#admin_page_title[name=?]", "admin_page[title]"

      assert_select "input#admin_page_description[name=?]", "admin_page[description]"

      assert_select "input#admin_page_published[name=?]", "admin_page[published]"

      assert_select "input#admin_page_in_menu[name=?]", "admin_page[in_menu]"
    end
  end
end
