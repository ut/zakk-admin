require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do

 describe "functionalities with logged in user with role 'admin'" do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    end

    let(:post) {
      FactoryBot.create(:post)
    }
    let(:valid_attributes) {
      FactoryBot.build(:post).attributes
    }
    let(:invalid_attributes) {
      FactoryBot.attributes_for(:post, :invalid)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # PostsController. Be sure to keep this updated too.
    let(:valid_session) { {} }


    describe "GET #index" do
      it "assigns all posts as @posts" do
        post = Post.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:posts)).to eq([post])
      end
    end

    describe "GET #show" do
      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        get :show, params: {:id => post.to_param}, session: valid_session
        expect(assigns(:post)).to eq(post)
      end
      it "redirects to public view of this post" do
        post = Post.create! valid_attributes
        get :show, params: {:id => post.to_param}, session: valid_session
        expect(response).to redirect_to(post_url(post))
      end
    end

    describe "GET #new" do
      it "assigns a new post as @post" do
        get :new, params: {}, session: valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end
      it "assigns a new post as @post and preselects program and ptype" do
        get :new, params: {:program => 1, :ptype => 0 }, session: valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end
    end

    describe "GET #edit" do
      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        get :edit, params: {:id => post.to_param}, session: valid_session
        expect(assigns(:post)).to eq(post)
      end
      it "assigns the requested post as @post and checks if location is set" do
        location = FactoryBot.create(:location)
        post = FactoryBot.create(:post, :location => location)
        get :edit, params: {:id => post.to_param}, session: valid_session
        expect(assigns(:post)).to eq(post)
        expect(assigns(:selected_location)).to eq(location.id)
      end
      it "assigns the requested post as @post and checks if location is not set" do
        location = FactoryBot.create(:location)
        post = FactoryBot.create(:post, :location => nil)
        get :edit, params: {:id => post.to_param}, session: valid_session
        expect(assigns(:post)).to eq(post)
        expect(assigns(:selected_location)).to eq("")
      end
    end

    describe "POST #create" do
      context "with valid params" do
        # post is a bad name for an Object if you have to use the post method
        xit "creates a new Post" do
          expect {
            post :create, post: valid_attributes
          }.to change(Post, :count).by(1)
        end

        xit "assigns a newly created post as @post" do
          post :create, params: {post: valid_attributes}, session: valid_session
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end

        xit "redirects to the created post" do
          # post is a bad name for an Object if you have to use the post method
          post :create, params: {:post => valid_attributes}, session: valid_session
          expect(response).to redirect_to(Post.last)
        end
      end

      context "with invalid params" do
        xit "assigns a newly created but unsaved post as @post" do
          # post is a bad name for an Object if you have to use the post method
          post :create, params: {:post => invalid_attributes}, session: valid_session
          expect(assigns(:post)).to be_a_new(Post)
        end

        xit "re-renders the 'new' template" do
          # post is a bad name for an Object if you have to use the post method
          post :create, params: {:post => invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end


    describe "GET #copy" do
      it "copies the requested post as @post" do
        post = Post.create! valid_attributes
        expect {
          get :copy, params: {:id => post.to_param}, session: valid_session
        }.to change(Post, :count).by(1)
      end
      it "set selected_location" do
        post = Post.create! valid_attributes
        get :copy, params: {:id => post.to_param}, session: valid_session
        # note: this test needs a factory w/location assoc + location_id
        expect(assigns(:selected_location)).to eq(post.location_id)
      end
      it "don't set selected_location" do
        post = Post.create! FactoryBot.attributes_for(:post, :missing_location)
        get :copy, params: {:id => post.to_param}, session: valid_session
        expect(assigns(:selected_location)).not_to eq(post.location_id)
        expect(assigns(:selected_location)).to eq('')
      end
      it "redirects the 'edit' view" do
        post = Post.create! valid_attributes
        get :copy, params: {:id => post.to_param}, session: valid_session
        expect(response).to redirect_to(edit_admin_post_url(assigns(:post)))
        expect(flash[:notice]).to match "Kopie dieses Post angelegt."
      end
    end


    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          FactoryBot.attributes_for(:post, title: "new post title")
        }

        it "updates the requested post" do
          post = Post.create! valid_attributes
          put :update, params: {:id => post.to_param, :post => new_attributes}, session: valid_session
          post.reload
          expect(post.title).to eq "new post title"
        end

        it "assigns the requested post as @post" do
          post = Post.create! valid_attributes
          put :update, params: {:id => post.to_param, :post => valid_attributes}, session: valid_session
          expect(assigns(:post)).to eq(post)
        end

        it "redirects to the post" do
          post = Post.create! valid_attributes
          put :update, params: {:id => post.to_param, :post => valid_attributes}, session: valid_session
          expect(response).to redirect_to(post)
        end
      end

      context "with invalid params" do
        it "assigns the post as @post" do
          post = Post.create! valid_attributes
          put :update, params: {:id => post.to_param, :post => invalid_attributes}, session: valid_session
          expect(assigns(:post)).to eq(post)
        end

        it "re-renders the 'edit' template" do
          post = Post.create! valid_attributes
          put :update, params: {:id => post.to_param, :post => invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested post" do
        post = Post.create! valid_attributes
        expect {
          delete :destroy, params: {:id => post.to_param}, session: valid_session
        }.to change(Post, :count).by(-1)
      end

      it "redirects to the posts list" do
        post = Post.create! valid_attributes
        delete :destroy, params: {:id => post.to_param}, session: valid_session
        expect(response).to redirect_to(admin_posts_url)
      end
    end

    describe "GET #set status (via XHR)" do

      it "change status to draft" do
        post = Post.create! valid_attributes
        get :set_status, params: {:id => post.to_param}, session: valid_session, format: :js, xhr: true
        expect(assigns(:post).status).to eq('Published')
      end
      it "change status to published" do
        post = Post.create! FactoryBot.attributes_for(:post, :published)
        get :set_status, params: {:id => post.to_param}, session: valid_session, format: :js, xhr: true
        expect(assigns(:post).status).to eq('Draft')
      end
      it "render js" do
        post = Post.create! FactoryBot.attributes_for(:post, :published)
        get :set_status, params: {:id => post.to_param}, session: valid_session, format: :js, xhr: true
        expect(response).to render_template("set_status")
      end


    end

  end
end
