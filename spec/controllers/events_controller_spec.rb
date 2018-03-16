require 'rails_helper'

RSpec.describe EventsController, type: :controller do

describe "functionalities with logged in user with role 'admin'" do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    end

    let(:valid_attributes) {
      FactoryBot.build(:event).attributes
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # EventsController. Be sure to keep this updated too.
    let(:valid_session) { {} }


    describe "GET #index" do
      it "assigns all events as @events" do
        event = Event.create! valid_attributes
        get :index, session: valid_session
        # expect(response).to redirect_to(root_url)
      end
    end

    describe "GET #show" do
      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        get :show, params: {:id => event.to_param}, session: valid_session
        expect(assigns(:event)).to eq(event)
      end
    end
  end
end
