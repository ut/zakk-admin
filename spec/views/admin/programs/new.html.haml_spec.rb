require 'rails_helper'

RSpec.describe "admin/programs/new", type: :view do
  before(:each) do
    assign(:program, Program.new(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new program form" do
    render

    assert_select "form[action=?][method=?]", admin_programs_path, "post" do

      assert_select "input#program_title[name=?]", "program[title]"

      assert_select "textarea#program_description[name=?]", "program[description]"

    end
  end
end
