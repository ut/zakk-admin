require 'rails_helper'

RSpec.describe "admin/programs/edit", type: :view do
  before(:each) do
    @program = FactoryGirl.create(:program)
  end

  it "renders the edit admin program form" do
    render

    assert_select "form[action=?][method=?]", admin_program_path(@program), "post" do

      assert_select "input#program_title[name=?]", "program[title]"

      assert_select "textarea#program_description[name=?]", "program[description]"

      assert_select "input#program_published[name=?]", "program[published]"
    end
  end
end
