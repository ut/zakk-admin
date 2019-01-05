require 'rails_helper'

RSpec.describe "admin/programs/show", type: :view do
  before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    @program = FactoryBot.create(:program,  :title => "Title")
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end
