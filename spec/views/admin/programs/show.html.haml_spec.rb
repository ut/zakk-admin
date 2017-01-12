require 'rails_helper'

RSpec.describe "admin/programs/show", type: :view do
  before(:each) do
    @program = FactoryGirl.create(:program)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end
