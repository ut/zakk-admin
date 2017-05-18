require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "Title",
      :description => "Description"
    ))
    @pages = assign(:pages, [
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
