require 'rails_helper'

RSpec.describe "admin/programs/show", type: :view do
  before(:each) do
    @admin_program = assign(:admin_program, Program.create!(
      :title => "Title",
      :description => "MyText",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
