require 'rails_helper'


RSpec.describe LocationsController, type: :controller do



  describe "functionalities with logged in user with role 'admin'" do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    end

    let(:location) {
      FactoryBot.create(:location)
    }
    let(:valid_attributes) {
      FactoryBot.build(:location).attributes
    }


    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # LocationsController. Be sure to keep this updated too.
    let(:valid_session) { {} }


    describe "GET #show" do
      it "assigns the requested location as @location" do
        location = Location.create! valid_attributes
        get :show, params: {:id => location.to_param}, session: valid_session
        expect(assigns(:location)).to eq(location)
      end
    end
  end
end
