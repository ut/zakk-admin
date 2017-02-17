require 'rails_helper'

RSpec.describe "admin/contents/show", type: :view do
  before(:each) do
    @admin_content = assign(:admin_content, Content.create!(
      :title => "Title",
      :text => "MyText",
      :published => false,
      :pos => 2,
      :col => 3,
      :page => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
