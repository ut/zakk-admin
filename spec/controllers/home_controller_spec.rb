require 'spec_helper'

describe HomeController do

  # it_should_redirect_guest_to_login(self)

  it "should show homepage" do
    get :index
    expect(response).to be_success
  end

end
