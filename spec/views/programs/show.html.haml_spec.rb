require 'rails_helper'

RSpec.describe "programs/show", type: :view do
  before(:each) do
    @program = assign(:program, Program.create!(
      :title => "Title"
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Title/)
  end
end
