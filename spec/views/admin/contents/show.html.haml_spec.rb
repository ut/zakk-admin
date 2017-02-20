require 'rails_helper'

RSpec.describe "admin/contents/show", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "MyString",
      :description => "MyString"
    ))

    @content = assign(:content, Content.create!(
      :title => "Title",
      :text => "MyText",
      :published => false,
      :pos => 2,
      :col => 3,
      :page => @page
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
