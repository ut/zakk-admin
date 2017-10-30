require 'rails_helper'


RSpec.describe Admin::LocationsController, type: :controller do



  describe "functionalities with logged in user with role 'admin'" do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user_with_admin_role)
      sign_in user
    end

    let(:location) {
      FactoryGirl.create(:location)
    }
    let(:valid_attributes) {
      FactoryGirl.build(:location).attributes
    }
    let(:invalid_attributes) {
      FactoryGirl.attributes_for(:location, :invalid)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # LocationsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
      it "assigns all locations as @locations" do
        location = Location.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:locations)).to eq([location])
      end
    end

    describe "GET #show" do
      it "assigns the requested location as @location" do
        location = Location.create! valid_attributes
        get :show, params: {:id => location.to_param}, session: valid_session
        expect(assigns(:location)).to eq(location)
      end
    end

    describe "GET #new" do
      it "assigns a new location as @location" do
        get :new, params: {}, session: valid_session
        expect(assigns(:location)).to be_a_new(Location)
      end
    end

    describe "GET #edit" do
      it "assigns the requested location as @location" do
        location = Location.create! valid_attributes
        get :edit, params: {:id => location.to_param}, session: valid_session
        expect(assigns(:location)).to eq(location)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Location" do
          expect {
            post :create, params:  {:location => valid_attributes}, session: valid_session
          }.to change(Location, :count).by(1)
        end

        it "assigns a newly created location as @location" do
          post :create, params:  {:location => valid_attributes}, session: valid_session
          expect(assigns(:location)).to be_a(Location)
          expect(assigns(:location)).to be_persisted
        end

        it "redirects to the created location" do
          post :create, params: {:location => valid_attributes}, session: valid_session
          expect(response).to redirect_to(Location.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved location as @location" do
          post :create, params: {:location => invalid_attributes}, session: valid_session
          expect(assigns(:location)).to be_a_new(Location)
        end

        it "re-renders the 'new' template" do
          post :create, params: {:location => invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested location" do
          location = Location.create! valid_attributes
          put :update, params: {:id => location.to_param, :location => new_attributes}, session: valid_session
          location.reload
          skip("Add assertions for updated state")
        end

        it "assigns the requested location as @location" do
          location = Location.create! valid_attributes
          put :update, params: {:id => location.to_param, :location => valid_attributes}, session: valid_session
          expect(assigns(:location)).to eq(location)
        end

        it "redirects to the location" do
          location = Location.create! valid_attributes
          put :update, params: {:id => location.to_param, :location => valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_location_url(location))
        end
      end

      context "with invalid params" do
        it "assigns the location as @location" do
          location = Location.create! valid_attributes
          put :update, params: {:id => location.to_param, :location => invalid_attributes}, session: valid_session
          expect(assigns(:location)).to eq(location)
        end

        it "re-renders the 'edit' template" do
          location = Location.create! valid_attributes
          put :update, params: {:id => location.to_param, :location => invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested location" do
        location = Location.create! valid_attributes
        expect {
          delete :destroy, params: {:id => location.to_param}, session: valid_session
        }.to change(Location, :count).by(-1)
      end

      it "redirects to the locations list" do
        location = Location.create! valid_attributes
        delete :destroy, params: {:id => location.to_param}, session: valid_session
        expect(response).to redirect_to(admin_locations_url)
      end
    end
  end
end
