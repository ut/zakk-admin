require 'rails_helper'

RSpec.describe "admin/flyers/show", type: :view do
  before(:each) do
    @admin_flyer = assign(:admin_flyer, Flyer.create!(
      :image => "Image",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Title/)
  end
end
