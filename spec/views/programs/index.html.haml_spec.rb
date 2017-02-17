require 'rails_helper'

RSpec.describe "programs/index", type: :view do
  before(:each) do
    assign(:programs, [
      Program.create!(
        :index => "Index"
      ),
      Program.create!(
        :index => "Index"
      )
    ])
  end

  it "renders a list of programs" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
