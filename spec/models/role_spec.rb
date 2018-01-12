require 'rails_helper'

RSpec.describe Role, type: :model do

  it "has a valid fe_name" do
    user = FactoryBot.create(:user_with_user_role)
    role = user.roles.first
    expect(role.fe_name).to eq('Benutzer')
  end
end
