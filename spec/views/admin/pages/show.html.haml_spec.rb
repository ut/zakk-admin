require 'rails_helper'

RSpec.describe "admin/pages/show", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "Title",
      :description => "Description",
      :published => false,
      :in_menu => false
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end
