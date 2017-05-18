require 'rails_helper'

RSpec.describe "admin/flyers/edit", type: :view do
  before(:each) do
    @flyer = assign(:flyer, Flyer.create!(
      :image => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit admin_flyer form" do
    render

    assert_select "form[action=?][method=?]", admin_flyer_path(@flyer), "post" do

      assert_select "input#flyer_image[name=?]", "flyer[image]"

      assert_select "input#flyer_title[name=?]", "flyer[title]"
    end
  end
end
