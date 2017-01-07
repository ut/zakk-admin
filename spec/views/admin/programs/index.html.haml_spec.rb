require 'rails_helper'

RSpec.describe "admin/programs/index", type: :view do
  before(:each) do
    assign(:programs, [
      Program.create!(
        :title => "Title",
        :description => "MyText",
        :published => false
      ),
      Program.create!(
        :title => "Title",
        :description => "MyText",
        :published => false
      )
    ])
  end

  it "renders a list of admin/programs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
