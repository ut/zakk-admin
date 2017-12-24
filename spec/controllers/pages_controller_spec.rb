require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Page. As you add validations to Page, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.build(:page).attributes
  }
  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:page, :invalid)
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested page as @page" do
      page = Page.create! valid_attributes
      get :show, params: {id: page.to_param}, session: valid_session
      expect(assigns(:page)).to eq(page)
    end
  end


end
