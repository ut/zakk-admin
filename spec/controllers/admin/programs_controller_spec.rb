require 'rails_helper'

RSpec.describe Admin::ProgramsController, type: :controller do

  describe "functionalities with logged in user with role 'admin'" do
    before do
      @user = FactoryBot.create(:user_with_admin_role)
      sign_in @user
    end
    # This should return the minimal set of attributes required to create a valid
    # Program. As you add validations to Program, be sure to
    # adjust the attributes here as well.
    let(:program) {
      FactoryBot.create(:program)
    }
    let(:valid_attributes) {
      FactoryBot.build(:program).attributes
    }
    let(:invalid_attributes) {
      FactoryBot.attributes_for(:program, :invalid)
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
      it "assigns the requested program as @program" do
        program = Program.create! valid_attributes
        get :show, params: {id: program.to_param}, session: valid_session
        expect(assigns(:program)).to eq(program)
      end
    end

    describe "GET #new" do
      it "assigns a new program as @program" do
        get :new, params: {}, session: valid_session
        expect(assigns(:program)).to be_a_new(Program)
        expect(assigns(:program).title).to be_nil
      end

      it "assigns a new program as copy of current_program" do
        @program = FactoryBot.create(:program, :current)
        get :new, params: {}, session: valid_session
        expect(assigns(:program)).to be_a_new(Program)
        expect(assigns(:program).title).to eq("#{@program.title} (copy)")
      end


    end

    describe "GET #edit" do
      it "assigns the requested program as @program" do
        program = Program.create! valid_attributes
        get :edit, params: {id: program.to_param}, session: valid_session
        expect(assigns(:program)).to eq(program)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Program" do
          expect {
            post :create, params: {program: valid_attributes}, session: valid_session
          }.to change(Program, :count).by(1)
        end

        it "assigns a newly created program as @program" do
          post :create, params: {program: valid_attributes}, session: valid_session
          expect(assigns(:program)).to be_a(Program)
          expect(assigns(:program)).to be_persisted
        end

        it "redirects to the created program" do
          post :create, params: {program: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_programs_url)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved program as @program" do
          post :create, params: {program: invalid_attributes}, session: valid_session
          expect(assigns(:program)).to be_a_new(Program)
        end

        it "re-renders the 'new' template" do
          post :create, params: {program: invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          FactoryBot.attributes_for(:program, title: "new program title")
        }

        it "updates the requested program" do
          program = Program.create! valid_attributes
          put :update, params: {id: program.to_param, program: new_attributes}, session: valid_session
          program.reload
          expect(program.title).to eq "new program title"
        end

        it "assigns the requested program as @program" do
          program = Program.create! valid_attributes
          put :update, params: {id: program.to_param, program: valid_attributes}, session: valid_session
          expect(assigns(:program)).to eq(program)
        end

        it "redirects to the program" do
          program = Program.create! valid_attributes
          put :update, params: {id: program.to_param, program: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_programs_url)
        end
      end

      context "with invalid params" do
        it "assigns the program as @program" do
          program = Program.create! valid_attributes
          put :update, params: {id: program.to_param, program: invalid_attributes}, session: valid_session
          expect(assigns(:program)).to eq(program)
        end

        it "re-renders the 'edit' template" do
          program = Program.create! valid_attributes
          put :update, params: {id: program.to_param, program: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested program" do
        program = Program.create! valid_attributes
        expect {
          delete :destroy, params: {id: program.to_param}, session: valid_session
        }.to change(Program, :count).by(-1)
      end

      it "redirects to the programs list" do
        program = Program.create! valid_attributes
        delete :destroy, params: {id: program.to_param}, session: valid_session
        expect(response).to redirect_to(admin_programs_url)
      end
    end

    describe "GET #sendmail" do

      it "sends program to a the user's email" do
        @program = Program.create! valid_attributes
        get :sendmail, params: {id: program.to_param}, session: valid_session
        delivery = double
        expect(ProgramsMailer).to receive(:program_email).with(@program,@user.email).and_return(delivery)
        ProgramsMailer.program_email(@program,@user.email)
      end

      it "redirects if no program is choosen" do
        get :sendmail, params: {id: 99}, session: valid_session
        expect(response).to redirect_to(root_url)
      end

    end
  end
end
