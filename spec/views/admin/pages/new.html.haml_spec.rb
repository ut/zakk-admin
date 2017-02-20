require 'rails_helper'

RSpec.describe "admin/pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new admin_page form" do
    render

    assert_select "form[action=?][method=?]", admin_pages_path, "post" do

      assert_select "input#page_title[name=?]", "page[title]"

      assert_select "input#page_description[name=?]", "page[description]"

    end
  end
end
