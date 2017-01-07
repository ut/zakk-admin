require 'rails_helper'

RSpec.describe "admin/programs/edit", type: :view do
  before(:each) do
    @admin_program = assign(:admin_program, Program.create!(
      :title => "MyString",
      :description => "MyText",
      :published => false
    ))
  end

  it "renders the edit admin_program form" do
    render

    assert_select "form[action=?][method=?]", admin_program_path(@admin_program), "post" do

      assert_select "input#admin_program_title[name=?]", "admin_program[title]"

      assert_select "textarea#admin_program_description[name=?]", "admin_program[description]"

      assert_select "input#admin_program_published[name=?]", "admin_program[published]"
    end
  end
end
