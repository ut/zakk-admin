require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Page. As you add validations to Page, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all pages as @pages" do
      page = Page.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:pages)).to eq([page])
    end
  end

  describe "GET #show" do
    it "assigns the requested page as @page" do
      page = Page.create! valid_attributes
      get :show, params: {id: page.to_param}, session: valid_session
      expect(assigns(:page)).to eq(page)
    end
  end


end
