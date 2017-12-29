require 'spec_helper'

describe HomeController do

  it "should show homepage" do
    get :index
    expect(response).to be_success
  end

end
