require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :title => "Title",
        :address => "Address",
        :zipcode => "Zipcode",
        :city => "City",
        :email => "Email",
        :web => "Web",
        :twitter => "Twitter",
        :lat => "Lat",
        :lon => "Lon",
        :shortext => "MyText",
        :longtext => "MyText"
      ),
      Location.create!(
        :title => "Title",
        :address => "Address",
        :zipcode => "Zipcode",
        :city => "City",
        :email => "Email",
        :web => "Web",
        :twitter => "Twitter",
        :lat => "Lat",
        :lon => "Lon",
        :shortext => "MyText",
        :longtext => "MyText"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
