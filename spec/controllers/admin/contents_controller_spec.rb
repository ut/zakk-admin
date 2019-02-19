require 'rails_helper'

RSpec.describe Admin::ContentsController, type: :controller do


  describe "functionalities with logged in user with role 'admin'" do
    before do
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    end
    # This should return the minimal set of attributes required to create a valid
    # Content. As you add validations to Content, be sure to
    # adjust the attributes here as well.
    let(:content) {
      FactoryBot.create(:content)
    }
    let(:valid_attributes) {
      FactoryBot.build(:content).attributes
    }
    let(:invalid_attributes) {
      FactoryBot.attributes_for(:content, :invalid)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # Admin::ContentsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
      it "assigns all contents as @contents" do
        content = FactoryBot.create(:content)
        get :index, params: {}, session: valid_session
        expect(assigns(:contents)).to eq([content])
      end
    end

    describe "GET #show" do
      it "assigns the requested content as @content" do
        content = FactoryBot.create(:content)
        get :show, params: {id: content.to_param}, session: valid_session
        expect(assigns(:content)).to eq(content)
      end
    end

    describe "GET #new" do
      it "assigns a new content as @content" do
        get :new, params: {}, session: valid_session
        expect(assigns(:content)).to be_a_new(Content)
      end
    end

    describe "GET #edit" do
      it "assigns the requested content as @content" do
        content = FactoryBot.create(:content)
        get :edit, params: {id: content.to_param}, session: valid_session
        expect(assigns(:content)).to eq(content)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Content" do
          expect {
            post :create, params: {content:valid_attributes}, session: valid_session
          }.to change(Content, :count).by(1)
        end

        it "assigns a newly created content as @content" do
          post :create, params: {content:valid_attributes}, session: valid_session
          expect(assigns(:content)).to be_a(Content)
          expect(assigns(:content)).to be_persisted
        end

        it "redirects to the created content " do
          post :create, params: {content:valid_attributes}, session: valid_session
          expect(response).to redirect_to([:admin,Content.last])
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved content as @content" do
          post :create, params: {content:invalid_attributes}, session: valid_session
          expect(assigns(:content)).to be_a_new(Content)
        end

        it "re-renders the 'new' template" do
          post :create, params: {content:invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          FactoryBot.attributes_for(:content, title: "new content title")

        }

        it "updates the requested content " do
          content = FactoryBot.create(:content)
          put :update, params: {id: content.to_param, content:new_attributes}, session: valid_session
          content.reload
          expect(content.title).to eq "new content title"
        end

        it "assigns the requested content as @content" do
          content = FactoryBot.create(:content)
          put :update, params: {id: content.to_param, content:valid_attributes}, session: valid_session
          expect(assigns(:content)).to eq(content)
        end

        it "redirects to the content " do
          content = FactoryBot.create(:content)
          put :update, params: {id: content.to_param, content:valid_attributes}, session: valid_session
          expect(response).to redirect_to([:admin,content])
        end
      end

      context "with invalid params" do
        it "assigns the content as @content" do
          content = FactoryBot.create(:content)
          put :update, params: {id: content.to_param, content:invalid_attributes}, session: valid_session
          expect(assigns(:content)).to eq(content)
        end

        it "re-renders the 'edit' template" do
          content = FactoryBot.create(:content)
          put :update, params: {id: content.to_param, content:invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested content" do
        content = FactoryBot.create(:content)
        expect {
          delete :destroy, params: {id: content.to_param}, session: valid_session
        }.to change(Content, :count).by(-1)
      end

      it "redirects to the contents list" do
        content = FactoryBot.create(:content)
        delete :destroy, params: {id: content.to_param}, session: valid_session
        expect(response).to redirect_to(admin_contents_url)
      end
    end
  end
end
