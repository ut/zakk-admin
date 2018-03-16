require 'rails_helper'

RSpec.describe Admin::PagesController, type: :controller do




  describe "functionalities with logged in user with role 'admin'" do
    before do
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    end

    describe "functionalities with logged in user with role 'admin'" do
      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        user = FactoryBot.create(:user_with_admin_role)
        sign_in user
      end

      # This should return the minimal set of attributes required to create a valid
      # Page. As you add validations to Page, be sure to
      # adjust the attributes here as well.
      let(:page) {
        FactoryBot.create(:page)
      }
      let(:valid_attributes) {
        FactoryBot.build(:page).attributes
      }
      let(:invalid_attributes) {
        FactoryBot.attributes_for(:page, :invalid)
      }

      # This should return the minimal set of values that should be in the session
      # in order to pass any filters (e.g. authentication) defined in
      # Admin::PagesController. Be sure to keep this updated too.
      let(:valid_session) { {} }

      describe "GET #index" do
        it "assigns all pages as @pages" do
          get :index, params: {}, session: valid_session
          expect(assigns(:pages)).to eq([page])
        end
      end

      describe "GET #show" do
        it "assigns the requested page as @page" do
          get :show, params: {id: page.to_param}, session: valid_session
          expect(assigns(:page)).to eq(page)
        end
      end

      describe "GET #new" do
        it "assigns a new page as @page" do
          get :new, params: {}, session: valid_session
          expect(assigns(:page)).to be_a_new(Page)
        end
      end

      describe "GET #edit" do
        it "assigns the requested page as @page" do
          get :edit, params: {id: page.to_param}, session: valid_session
          expect(assigns(:page)).to eq(page)
        end
      end

      describe "POST #create" do
        context "with valid params" do
          it "creates a new Page" do
            expect {
              post :create, params: {page: valid_attributes}, session: valid_session
            }.to change(Page, :count).by(1)
          end

          it "assigns a newly created page as @page" do
            post :create, params: {page: valid_attributes}, session: valid_session
            expect(assigns(:page)).to be_a(Page)
            expect(assigns(:page)).to be_persisted
          end

          it "redirects to the created page" do
            post :create, params: {page: valid_attributes}, session: valid_session
            expect(response).to redirect_to(Page.last)
          end
        end

        context "with invalid params" do
          it "assigns a newly created but unsaved page as @page" do
            post  :create, params: {:page => invalid_attributes}, session: valid_session
            expect(assigns(:page)).to be_a_new(Page)
          end

          it "re-renders the 'new' template" do
            post :create, params: {:page => invalid_attributes}, session: valid_session
            expect(response).to render_template("new")
          end
        end
      end

      describe "PUT #update" do
        context "with valid params" do
          let(:new_attributes) {
            FactoryBot.attributes_for(:page, title: "new page title")
          }

          it "updates the requested page" do
            put :update, params: {id: page.to_param, page: new_attributes}, session: valid_session
            page.reload
            expect(page.title).to eq "new page title"
          end

          it "assigns the requested page as @page" do
            put :update, params: {id: page.to_param, page: valid_attributes}, session: valid_session
            expect(assigns(:page)).to eq(page)
          end

          it "redirects to the page" do
            put :update, params: {id: page.to_param, page: valid_attributes}, session: valid_session
            expect(response).to redirect_to(page)
          end
        end

        context "with invalid params" do
          it "assigns the page as @page" do
            page = Page.create! valid_attributes
            put :update, params: {:id => page.to_param, :page => invalid_attributes}, session: valid_session
            expect(assigns(:page)).to eq(page)
          end

          it "re-renders the 'edit' template" do
            page = Page.create! valid_attributes
            put :update, params: {:id => page.to_param, :page => invalid_attributes}, session: valid_session
            expect(response).to render_template("edit")
          end
        end
      end

      describe "DELETE #destroy" do
        it "destroys the requested page" do
          page = Page.create! valid_attributes
          expect {
            delete :destroy, params: {id: page.to_param}, session: valid_session
          }.to change(Page, :count).by(-1)
        end

        it "redirects to the pages list" do
          delete :destroy, params: {id: page.to_param}, session: valid_session
          expect(response).to redirect_to(admin_pages_url)
        end
      end
    end
  end
end