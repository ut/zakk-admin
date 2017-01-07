require 'spec_helper'

describe HomeController do

  it_should_redirect_guest_to_login(self)

  it "should show homepage for logged in user" do
    sign_in create(:user_with_admin_role)
    get :index
    response.should be_success
  end

end
