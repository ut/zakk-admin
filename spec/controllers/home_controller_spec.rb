require 'spec_helper'

describe HomeController do

  it "should show homepage" do
    get :index
    expect(response).to be_success
  end

  xit "should bomb on purpose (to test exception notifier)" do
    expect(get :bomb).to raise_exception
  end

end
