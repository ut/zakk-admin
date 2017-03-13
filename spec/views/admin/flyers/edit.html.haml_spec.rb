require 'rails_helper'

RSpec.describe "admin/flyers/edit", type: :view do
  before(:each) do
    @admin_flyer = assign(:admin_flyer, Flyer.create!(
      :image => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit admin_flyer form" do
    render

    assert_select "form[action=?][method=?]", admin_flyer_path(@admin_flyer), "post" do

      assert_select "input#admin_flyer_image[name=?]", "admin_flyer[image]"

      assert_select "input#admin_flyer_title[name=?]", "admin_flyer[title]"
    end
  end
end
