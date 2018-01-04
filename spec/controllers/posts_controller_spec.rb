require 'rails_helper'

RSpec.describe PostsController, type: :controller do

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
        get :index, session: valid_session
        # expect(response).to redirect_to(root_url)
      end
    end

    describe "GET #show" do
      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        get :show, params: {:id => post.to_param}, session: valid_session
        expect(assigns(:post)).to eq(post)
      end
    end
  end
end
