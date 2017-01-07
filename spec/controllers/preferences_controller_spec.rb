require 'spec_helper'

describe PreferencesController do

  
  describe "functionalities for guests" do
    it "should redirect guests to login " do
      get :edit
      response.should redirect_to( new_user_session_path )
    end

  end

  describe "functionalities with logged in user with role 'user'" do
    before do
      sign_in create(:user_with_user_role)
    end

    it "edit" do
      get :edit, id: User.first.id
      response.should be_success
    end

    it "should update" do
      @user = create(:user)
      put :edit, id: @user.id, user: @user
      response.should be_successful
      flash.now[:notice].should match "Benutzerdaten aktualisiert"
    end
  end 
  
end

