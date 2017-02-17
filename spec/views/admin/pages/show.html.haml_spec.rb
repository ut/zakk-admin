require 'rails_helper'

RSpec.describe "admin/pages/show", type: :view do
  before(:each) do
    @admin_page = assign(:admin_page, Page.create!(
      :title => "Title",
      :description => "Description",
      :published => false,
      :in_menu => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
