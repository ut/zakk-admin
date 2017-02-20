require 'rails_helper'

RSpec.describe "admin/contents/index", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "MyString",
      :description => "MyString"
    ))
    assign(:contents, [
      Content.create!(
        :title => "Title",
        :text => "MyText",
        :published => false,
        :pos => 2,
        :col => 3,
        :page => @page
      ),
      Content.create!(
        :title => "Title",
        :text => "MyText",
        :published => false,
        :pos => 2,
        :col => 3,
        :page => @page
      )
    ])
  end

  it "renders a list of admin/contents" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
