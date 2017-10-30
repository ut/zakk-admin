require 'rails_helper'

RSpec.describe "admin/programs/index", type: :view do
  before(:each) do
    assign(:programs, [
      Program.create!(
        :title => "Title1",
        :description => "MyText",
        :published => false
      ),
      Program.create!(
        :title => "Title2",
        :description => "MyText",
        :published => false
      )
    ])
  end

  it "renders a list of admin/programs" do
    render
    # puts @rendered
    assert_select "tr>td>h4>a", :text => "Title1".to_s, :count => 1
    assert_select "tr>td>h4>a", :text => "Title2".to_s, :count => 1
  end
end
