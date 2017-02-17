require 'rails_helper'


RSpec.describe ProgramsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Program. As you add validations to Program, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProgramsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all programs as @programs" do
      program = Program.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:programs)).to eq([program])
    end
  end

  describe "GET #show" do
    it "assigns the requested program as @program" do
      program = Program.create! valid_attributes
      get :show, params: {id: program.to_param}, session: valid_session
      expect(assigns(:program)).to eq(program)
    end
  end

end
