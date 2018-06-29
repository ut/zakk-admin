require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "Title",
      :description => "Description"
    ))
    @pages = assign(:pages, [
      Page.create!(
        :title => "Background",
        :description => "Description",
        :published => false,
        :in_menu => false
      ),
      Page.create!(
        :title => "Info",
        :description => "Description",
        :published => true,
        :in_menu => true
      ),
      Page.create!(
        :title => "Privacy",
        :description => "Description",
        :published => true,
        :in_menu => false,
        :in_footer => true
      )
    ])
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end

  it "renders info page in menu" do
    render
    expect(rendered).to match(/Info/)
  end

  it "renders privacy page link in footermenu" do
    render
    expect(rendered).to match(/Privacy/)
  end
end
