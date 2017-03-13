require 'rails_helper'

RSpec.describe "admin/flyers/new", type: :view do
  before(:each) do
    assign(:admin_flyer, Flyer.new(
      :image => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new admin_flyer form" do
    render

    assert_select "form[action=?][method=?]", flyers_path, "post" do

      assert_select "input#admin_flyer_image[name=?]", "admin_flyer[image]"

      assert_select "input#admin_flyer_title[name=?]", "admin_flyer[title]"
    end
  end
end
