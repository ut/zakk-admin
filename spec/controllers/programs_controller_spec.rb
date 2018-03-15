require 'rails_helper'


RSpec.describe ProgramsController, type: :controller do


  let(:valid_attributes) {
    FactoryBot.build(:program).attributes
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "redirect to current_program" do
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(program_url(subject.current_program))
    end

    it "never redirect to root" do
      expect(subject.current_program.id).to eq(1)
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(program_path(subject.current_program))
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

    it "renders the show template if current_user" do
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
