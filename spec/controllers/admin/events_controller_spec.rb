require 'rails_helper'

RSpec.describe Admin::EventsController, type: :controller do

 describe "functionalities with logged in user with role 'admin'" do
    before do
      user = FactoryBot.create(:user_with_admin_role)
      sign_in user
    end

    let(:event) {
      FactoryBot.create(:event)
    }
    let(:valid_attributes) {
      location = FactoryBot.create(:location)
      FactoryBot.build(:event, :location => location).attributes
    }
    let(:invalid_attributes) {
      FactoryBot.attributes_for(:event, :invalid)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # EventsController. Be sure to keep this updated too.
    let(:valid_session) { {} }


    describe "GET #index" do
      it "assigns all events as @events" do
        event = Event.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:events)).to eq([event])
      end
    end

    describe "GET #show" do
      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        get :show, params: {:id => event.to_param}, session: valid_session
        expect(assigns(:event)).to eq(event)
      end
      it "redirects to public view of this event" do
        event = Event.create! valid_attributes
        get :show, params: {:id => event.to_param}, session: valid_session
        expect(response).to redirect_to(event_url(event))
      end
    end

    describe "GET #new" do
      it "assigns a new event as @event" do
        get :new, params: {}, session: valid_session
        expect(assigns(:event)).to be_a_new(Event)
      end
      it "assigns a new event as @event and preselects program and ptype" do
        get :new, params: {:program => 1, :ptype => 0 }, session: valid_session
        expect(assigns(:event)).to be_a_new(Event)
      end
    end

    describe "GET #edit" do
      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        get :edit, params: {:id => event.to_param}, session: valid_session
        expect(assigns(:event)).to eq(event)
      end
      it "assigns the requested event as @event and checks if location is set" do
        location = FactoryBot.create(:location)
        event = FactoryBot.create(:event, :location => location)
        get :edit, params: {:id => event.to_param}, session: valid_session
        expect(assigns(:event)).to eq(event)
        expect(assigns(:selected_location)).to eq(location.id)
      end
      it "assigns the requested event as @event and checks if location is not set" do
        location = FactoryBot.create(:location)
        event = FactoryBot.create(:event, :location => nil)
        get :edit, params: {:id => event.to_param}, session: valid_session
        expect(assigns(:event)).to eq(event)
        expect(assigns(:selected_location)).to eq("")
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Event" do
          expect {
            post :create, params: {event: valid_attributes}
          }.to change(Event, :count).by(1)
        end

        it "assigns a newly created event as @event" do
          post  :create, params: {event: valid_attributes}, session: valid_session
          expect(assigns(:event)).to be_a(Event)
          expect(assigns(:event)).to be_persisted
        end

        it "redirects to the created event" do
          # event is a bad name for an Object if you have to use the event method
          post :create, params: {event: valid_attributes}, session: valid_session
          # expect(response).to redirect_to(Event.last)
          expect(response).to redirect_to(new_admin_event_url)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved event as @event" do
          post  :create, params: {:event => invalid_attributes}, session: valid_session
          expect(assigns(:event)).to be_a_new(Event)
        end

        it "re-renders the 'new' template" do
          post :create, params: {:event => invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end


    describe "GET #copy" do
      it "copies the requested event as @event" do
        event = Event.create! valid_attributes
        expect {
          get :copy, params: {:id => event.to_param}, session: valid_session
        }.to change(Event, :count).by(1)
      end
      it "set selected_location" do
        event = Event.create! valid_attributes
        get :copy, params: {:id => event.to_param}, session: valid_session
        # note: this test needs a factory w/location assoc + location_id
        expect(assigns(:selected_location)).to eq(event.location_id)
      end
      it "don't set selected_location" do
        event = Event.create! FactoryBot.attributes_for(:event, :missing_location)
        get :copy, params: {:id => event.to_param}, session: valid_session
        expect(assigns(:selected_location)).not_to eq(event.location_id)
        expect(assigns(:selected_location)).to eq('')
      end
      it "redirects the 'edit' view" do
        event = Event.create! valid_attributes
        get :copy, params: {:id => event.to_param}, session: valid_session
        expect(response).to redirect_to(edit_admin_event_url(assigns(:event)))
        expect(flash[:notice]).to match "Kopie dieses Event angelegt."
      end
    end


    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          FactoryBot.attributes_for(:event, title: "new event title")
        }

        it "updates the requested event" do
          event = Event.create! valid_attributes
          put :update, params: {:id => event.to_param, :event => new_attributes}, session: valid_session
          event.reload
          expect(event.title).to eq "new event title"
        end

        it "assigns the requested event as @event" do
          event = Event.create! valid_attributes
          put :update, params: {:id => event.to_param, :event => valid_attributes}, session: valid_session
          expect(assigns(:event)).to eq(event)
        end

        it "redirects to the event" do
          event = Event.create! valid_attributes
          put :update, params: {:id => event.to_param, :event => valid_attributes}, session: valid_session
          expect(response).to redirect_to(event)
        end
      end

      context "with invalid params" do
        it "assigns the event as @event" do
          event = Event.create! valid_attributes
          put :update, params: {:id => event.to_param, :event => invalid_attributes}, session: valid_session
          expect(assigns(:event)).to eq(event)
        end

        it "re-renders the 'edit' template" do
          event = Event.create! valid_attributes
          put :update, params: {:id => event.to_param, :event => invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested event" do
        event = Event.create! valid_attributes
        expect {
          delete :destroy, params: {:id => event.to_param}, session: valid_session
        }.to change(Event, :count).by(-1)
      end

      it "redirects to the events list" do
        event = Event.create! valid_attributes
        delete :destroy, params: {:id => event.to_param}, session: valid_session
        expect(response).to redirect_to(admin_events_url)
      end
    end

    describe "GET #set status (via XHR)" do

      it "change status to draft" do
        event = Event.create! valid_attributes
        get :set_status, params: {:id => event.to_param}, session: valid_session, format: :js, xhr: true
        expect(assigns(:event).status).to eq('Published')
      end
      it "change status to published" do
        event = Event.create! FactoryBot.attributes_for(:event, :published)
        get :set_status, params: {:id => event.to_param}, session: valid_session, format: :js, xhr: true
        expect(assigns(:event).status).to eq('Draft')
      end
      it "render js" do
        event = Event.create! FactoryBot.attributes_for(:event, :published)
        get :set_status, params: {:id => event.to_param}, session: valid_session, format: :js, xhr: true
        expect(response).to render_template("set_status")
      end
    end

  end
end
