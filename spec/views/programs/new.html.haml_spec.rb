require 'rails_helper'

RSpec.describe "programs/new", type: :view do
  before(:each) do
    assign(:program, Program.new(
      :title => "MyString",
      :description => "MyText",
      :published => false
    ))
  end

  it "renders new program form" do
    render

    assert_select "form[action=?][method=?]", programs_path, "post" do

      assert_select "input#program_title[name=?]", "program[title]"

      assert_select "textarea#program_description[name=?]", "program[description]"

      assert_select "input#program_published[name=?]", "program[published]"
    end
  end
end
