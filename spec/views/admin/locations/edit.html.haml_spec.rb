require 'rails_helper'

RSpec.describe "admin/locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :title => "MyString",
      :address => "MyString",
      :zipcode => "MyString",
      :city => "MyString",
      :email => "MyString",
      :web => "MyString",
      :twitter => "MyString",
      :lat => "MyString",
      :lon => "MyString",
      :shortext => "MyText",
      :longtext => "MyText"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", admin_location_path(@location), "post" do

      assert_select "input#location_title[name=?]", "location[title]"

      assert_select "input#location_address[name=?]", "location[address]"

      assert_select "input#location_zipcode[name=?]", "location[zipcode]"

      assert_select "input#location_city[name=?]", "location[city]"

      assert_select "input#location_email[name=?]", "location[email]"

      assert_select "input#location_web[name=?]", "location[web]"

      assert_select "input#location_twitter[name=?]", "location[twitter]"

      assert_select "input#location_lat[name=?]", "location[lat]"

      assert_select "input#location_lon[name=?]", "location[lon]"

      assert_select "textarea#location_shortext[name=?]", "location[shortext]"

      assert_select "textarea#location_longtext[name=?]", "location[longtext]"
    end
  end
end
