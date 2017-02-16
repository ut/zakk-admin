require 'rails_helper'

RSpec.describe Admin::ProgramsController, type: :controller do

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
  # Admin::ProgramsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all programs as @programs" do
      program = Program.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:programs)).to eq([program])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_program as @admin_program" do
      program = Program.create! valid_attributes
      get :show, params: {id: program.to_param}, session: valid_session
      expect(assigns(:admin_program)).to eq(program)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_program as @admin_program" do
      get :new, params: {}, session: valid_session
      expect(assigns(:admin_program)).to be_a_new(Program)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_program as @admin_program" do
      program = Program.create! valid_attributes
      get :edit, params: {id: program.to_param}, session: valid_session
      expect(assigns(:admin_program)).to eq(program)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Program" do
        expect {
          post :create, params: {admin_program: valid_attributes}, session: valid_session
        }.to change(Program, :count).by(1)
      end

      it "assigns a newly created admin_program as @admin_program" do
        post :create, params: {admin_program: valid_attributes}, session: valid_session
        expect(assigns(:admin_program)).to be_a(Program)
        expect(assigns(:admin_program)).to be_persisted
      end

      it "redirects to the created admin_program" do
        post :create, params: {admin_program: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Program.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_program as @admin_program" do
        post :create, params: {admin_program: invalid_attributes}, session: valid_session
        expect(assigns(:admin_program)).to be_a_new(Program)
      end

      it "re-renders the 'new' template" do
        post :create, params: {admin_program: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, admin_program: new_attributes}, session: valid_session
        program.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin_program as @admin_program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, admin_program: valid_attributes}, session: valid_session
        expect(assigns(:admin_program)).to eq(program)
      end

      it "redirects to the admin_program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, admin_program: valid_attributes}, session: valid_session
        expect(response).to redirect_to(program)
      end
    end

    context "with invalid params" do
      it "assigns the admin_program as @admin_program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, admin_program: invalid_attributes}, session: valid_session
        expect(assigns(:admin_program)).to eq(program)
      end

      it "re-renders the 'edit' template" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, admin_program: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_program" do
      program = Program.create! valid_attributes
      expect {
        delete :destroy, params: {id: program.to_param}, session: valid_session
      }.to change(Program, :count).by(-1)
    end

    it "redirects to the programs list" do
      program = Program.create! valid_attributes
      delete :destroy, params: {id: program.to_param}, session: valid_session
      expect(response).to redirect_to(programs_url)
    end
  end

end
