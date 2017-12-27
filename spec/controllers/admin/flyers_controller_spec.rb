require 'rails_helper'


RSpec.describe Admin::FlyersController, type: :controller do


  describe "functionalities with logged in user with role 'admin'" do
    before do
      user = FactoryGirl.create(:user_with_admin_role)
      sign_in user
    end


    let(:flyer) {
      FactoryGirl.create(:flyer)
    }
    let(:valid_attributes) {
      FactoryGirl.build(:flyer).attributes
    }
    let(:invalid_attributes) {
      FactoryGirl.attributes_for(:flyer, :invalid)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # Admin::FlyersController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
      it "assigns all flyers as @flyers" do
        flyer = Flyer.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:flyers)).to eq([flyer])
      end
    end

    describe "GET #new" do
      it "assigns a new flyer as @flyer" do
        get :new, params: {}, session: valid_session
        expect(assigns(:flyer)).to be_a_new(Flyer)
      end
    end

    describe "GET #edit" do
      it "assigns the requested flyer as @flyer" do
        flyer = Flyer.create! valid_attributes
        get :edit, params: {id: flyer.to_param}, session: valid_session
        expect(assigns(:flyer)).to eq(flyer)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Flyer" do
          expect {
            post :create, params: {flyer: valid_attributes}, session: valid_session
          }.to change(Flyer, :count).by(1)
        end

        it "assigns a newly created flyer as @flyer" do
          post :create, params: {flyer: valid_attributes}, session: valid_session
          expect(assigns(:flyer)).to be_a(Flyer)
          expect(assigns(:flyer)).to be_persisted
        end

        it "redirects to the created flyer" do
          post :create, params: {flyer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_flyers_url)
        end
      end

      context "with invalid params" do

        # pending: fix carrierwave + validate problem, see model

        xit "assigns a newly created but unsaved flyer as @flyer" do
          post :create, params: {flyer: invalid_attributes}, session: valid_session
          expect(assigns(:flyer)).to be_a_new(Flyer)
        end

        xit "re-renders the 'new' template" do
          post :create, params: {flyer: invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          FactoryGirl.attributes_for(:location, title: "new flyer title")
        }

        it "updates the requested flyer" do
          flyer = Flyer.create! valid_attributes
          put :update, params: {id: flyer.to_param, flyer: new_attributes}, session: valid_session
          flyer.reload
          expect(flyer.title).to eq "new flyer title"
        end

        it "assigns the requested flyer as @flyer" do
          flyer = Flyer.create! valid_attributes
          put :update, params: {id: flyer.to_param, flyer: valid_attributes}, session: valid_session
          expect(assigns(:flyer)).to eq(flyer)
        end

        it "redirects to the flyer" do
          flyer = Flyer.create! valid_attributes
          put :update, params: {id: flyer.to_param, flyer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_flyers_url)
        end
      end

      context "with invalid params" do
        it "assigns the flyer as @flyer" do
          flyer = Flyer.create! valid_attributes
          put :update, params: {id: flyer.to_param, flyer: invalid_attributes}, session: valid_session
          expect(assigns(:flyer)).to eq(flyer)
        end

        xit "re-renders the 'edit' template" do
          flyer = Flyer.create! valid_attributes
          put :update, params: {id: flyer.to_param, flyer: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_flyers_url)

        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested flyer" do
        flyer = Flyer.create! valid_attributes
        expect {
          delete :destroy, params: {id: flyer.to_param}, session: valid_session
        }.to change(Flyer, :count).by(-1)
      end

      it "redirects to the flyers list" do
        flyer = Flyer.create! valid_attributes
        delete :destroy, params: {id: flyer.to_param}, session: valid_session
        expect(response).to redirect_to(admin_flyers_url)
      end
    end
  end
end
