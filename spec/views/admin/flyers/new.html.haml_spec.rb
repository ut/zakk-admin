require 'rails_helper'

RSpec.describe "admin/flyers/new", type: :view do
  before(:each) do
    assign(:flyer, Flyer.new(
      :image => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new admin_flyer form" do
    render

    assert_select "form[action=?][method=?]", admin_flyers_path, "post" do

      assert_select "input#flyer_image[name=?]", "flyer[image]"

      assert_select "input#flyer_title[name=?]", "flyer[title]"
    end
  end
end
