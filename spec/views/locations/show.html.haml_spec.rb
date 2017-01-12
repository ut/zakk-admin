require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Web/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
