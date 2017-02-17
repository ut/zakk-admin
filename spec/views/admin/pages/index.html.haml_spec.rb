require 'rails_helper'

RSpec.describe "admin/pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :title => "Title",
        :description => "Description",
        :published => false,
        :in_menu => false
      ),
      Page.create!(
        :title => "Title",
        :description => "Description",
        :published => false,
        :in_menu => false
      )
    ])
  end

  it "renders a list of admin/pages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
