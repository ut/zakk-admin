require 'rails_helper'

RSpec.describe "admin/contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(
        :title => "Title",
        :text => "MyText",
        :published => false,
        :pos => 2,
        :col => 3,
        :page => nil
      ),
      Content.create!(
        :title => "Title",
        :text => "MyText",
        :published => false,
        :pos => 2,
        :col => 3,
        :page => nil
      )
    ])
  end

  it "renders a list of admin/contents" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
