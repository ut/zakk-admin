require 'spec_helper'

describe PreferencesController do


  describe "functionalities for guests" do
    it "should redirect guests to login " do
      get :edit
      expect(response).to redirect_to( new_user_session_path )
    end

  end

  describe "functionalities with logged in user with role 'user'" do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end

    it "edit" do
      get :edit, params: { id: User.first.id }
      response.should be_success
    end

    xit "should update" do
      put :edit, params: {id: User.first.id, user: User.first}
      response.should be_successful
      flash.now[:notice].should match "Benutzerdaten aktualisiert"
    end
  end

end

