require 'rails_helper'

RSpec.describe "programs/show.xml.builder", type: :view do
  before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    @program = FactoryBot.create(:program,  :title => "Title")
  end

  it "renders xml" do
    render
    expect(rendered).to include '<?xml version="1.0" encoding="UTF-8"?>'
  end

  it "renders some basic tags" do
    render
    expect(rendered).to include '<program_title>Title</program_title>'
    expect(rendered).to include '<program_hint>zakk Monatsprogramm (XML Export for Adobe Indesign)</program_hint>'
  end
end
