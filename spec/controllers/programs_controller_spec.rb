require 'rails_helper'


RSpec.describe ProgramsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Program. As you add validations to Program, be sure to
  # adjust the attributes here as well.
  let(:program) {
    FactoryGirl.create(:program)
  }
  let(:valid_attributes) {
    FactoryGirl.build(:program).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:program, :invalid)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProgramsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all programs as @programs" do
      program = Program.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(root_url)
    end
  end

  describe "GET #show" do
    it "assigns the requested program as @program" do
      program = Program.create! valid_attributes
      get :show, params: {id: program.to_param}, session: valid_session
      expect(assigns(:program)).to eq(program)
    end

    it "redirect to <http://test.host/> if param is not 'current'" do
      program = Program.create! valid_attributes
      get :show, params: {id: program.to_param}, session: valid_session
      expect(response).to redirect_to(root_url)
    end

    it "renders the show template if param is 'current'" do
      get :show, params: {id: "current"}, session: valid_session
      expect(response).to render_template("show")
    end

    xit "renders the show template if current_user" do
      get :show, params: {id: "current"}, session: valid_session
      expect(response).to render_template("show")
    end

    it "renders the show template if param is 'current'" do
      program = Program.create! valid_attributes
      get :show, params: {id: "current"}, session: valid_session
      expect(response).to render_template("show")
    end

  end

end
