require 'spec_helper'

describe Admin::UsersController do

  # it_should_redirect_guest_to_login(self)
  # it_should_not_authorize(self, :user_with_user_role)

  describe "functionalities with logged in user with role 'user'" do
    before do
      user = FactoryGirl.create(:user)
      sign_in user
    end

    it "create" do
      get :create, params: {user: FactoryGirl.build(:user).attributes}
      expect(response).to be_success

    end

    it "destroy" do
      count = User.count
      delete :destroy, params: { id: User.first.id }
      expect(response).to redirect_to(admin_users_path)
      assert_equal count-1, User.count
    end

    it "edit" do
      get :edit, params: { id: User.first.id }
      expect(response).to be_success
    end

    it "index" do
      get :index
      expect(response).to be_success
    end

    it "new" do
      get :new
      expect(response).to be_success
    end

    it "should create new user and redirect to index" do
      user = FactoryGirl.build(:user)
      count = User.count
      post :create, params: { user: { login: 'testuser', password: 'monkey', password_confirmation: 'monkey', email: "a@cdb.de" }}
      User.count.should == count + 1
      expect(response).to redirect_to(admin_users_path)
      flash[:notice].should match "Benutzer angelegt"
    end

    it "should show" do
      get :show, params: { id: User.first.id }
      expect(response).to be_success
    end

    it "should undelete" do
      get :undelete, params: { id: User.first.id }
      expect(response).to redirect_to(admin_users_path)
    end

    xit "should update" do
      get :show, params: { id: User.first.id }
      expect(response).to redirect_to(admin_users_path)
    end
  end

end