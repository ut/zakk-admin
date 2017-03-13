require 'rails_helper'

RSpec.describe "admin/flyers/index", type: :view do
  before(:each) do
    assign(:flyers, [
      Flyer.create!(
        :image => "Image",
        :title => "Title"
      ),
      Flyer.create!(
        :image => "Image",
        :title => "Title"
      )
    ])
  end

  it "renders a list of admin/flyers" do
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
