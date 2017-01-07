require 'spec_helper'

describe Admin::UsersController do

  it_should_redirect_guest_to_login(self)
  it_should_not_authorize(self, :user_with_user_role)

  describe "functionalities with logged in user with role 'user'" do
    before do
      sign_in create(:user_with_admin_role)
    end

    it "create" do
      get :create
      response.should be_success
    end

    it "destroy" do
      count = User.count
      delete :destroy, id: User.first.id
      response.should redirect_to(admin_users_path)
      assert_equal count-1, User.count
    end

    it "edit" do
      get :edit, id: User.first.id
      response.should be_success
    end

    it "index" do
      get :index
      response.should be_success
    end

    it "new" do
      get :new
      response.should be_success
    end

    it "should create new user and redirect to index" do
      user = build(:user)
      count = User.count
      post :create, user: { login: 'testuser', password: 'monkey', password_confirmation: 'monkey', email: "a@cdb.de" }
      User.count.should == count + 1
      response.should redirect_to(admin_users_path)
      flash[:notice].should match "Benutzer angelegt"
    end

    it "should show" do
      get :show, id: User.first.id
      response.should be_success
    end

    it "should undelete" do
      get :undelete, id: User.first.id
      response.should redirect_to(admin_users_path)
    end

    it "should update" do
      post :update, id: User.first.id
      response.should redirect_to(admin_user_path(User.first.id))
    end
  end

end