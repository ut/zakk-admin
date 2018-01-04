require 'rails_helper'

describe PreferencesController, type: :controller  do


  describe "functionalities for guests" do
    it "should redirect guests to login " do
      user = FactoryBot.create(:user)
      get :edit, params: { id: user.id }
      expect(response).to redirect_to( new_user_session_path )
    end

  end

  describe "functionalities with logged in user with role 'user'" do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    it "edit response should be success" do
      get :edit, params: { id: User.first.id }
      response.should be_success
    end

    it "edit should handle params" do
      get :edit, params: { id: User.first.id }
      response.should be_success
    end

    it "edit response should be success" do
      get :edit, params: { user: FactoryBot.build(:user).attributes }
      response.should be_success
    end

    it "should update" do
      put :edit, params: {id: User.first.id, user: FactoryBot.build(:user).attributes }
      response.should be_successful
    end
  end

end

