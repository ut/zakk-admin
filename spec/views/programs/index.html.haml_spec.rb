require 'rails_helper'

RSpec.describe "programs/index", type: :view do
  before(:each) do
    assign(:programs, [
      Program.create!(
        :title => "Title1"
      ),
      Program.create!(
        :title => "Title2"
      )
    ])
  end

  it "renders a list of programs" do
    render
    assert_select "tr>td", :text => "Title1".to_s, :count => 1
    assert_select "tr>td", :text => "Title2".to_s, :count => 1
  end
end
