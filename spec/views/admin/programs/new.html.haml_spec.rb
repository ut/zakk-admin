require 'rails_helper'

RSpec.describe "admin/programs/new", type: :view do
  before(:each) do
    @program = FactoryGirl.create(:program)
  end

  it "renders new admin_program form" do
    render

    assert_select "form[action=?][method=?]", admin_programs_path, "post" do

      assert_select "input#admin_program_title[name=?]", "admin_program[title]"

      assert_select "textarea#admin_program_description[name=?]", "admin_program[description]"

      assert_select "input#admin_program_published[name=?]", "admin_program[published]"
    end
  end
end
