class Admin::EventsController < Admin::AdminController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :set_status]

  layout 'admin'

  before_action :authenticate_user!

  respond_to :html

  def index

    # TODO: show only events not older than 1 month
    @events = Event.all
    @grid = EventsGrid.new(params[:events_grid]) do |scope|
      scope.page(params[:page])
    end
    respond_with(@events)
  end

  def show
    redirect_to event_path(@event)
  end

  def new
    @event = Event.new

    @selected_location = helpers.default_location_id
    @selected_program = helpers.current_program_id
    @selected_status = helpers.default_status
    @selected_ptype = helpers.default_ptype

    require 'uri'

    if params[:program]
      @selected_program = URI.unescape(params[:program])
    end

    if params[:ptype]
      @selected_ptype = params[:ptype].to_i
    end

    respond_with(@event)
  end

  def edit

    if @event.location.present?
      @selected_location = @event.location_id
    else
      @selected_location = ''
    end
    @selected_program = @event.program_id
    @selected_status = @event.status
    @selected_ptype = @event.ptype

  end

  def create
    @event = Event.new(event_params)
    @event.save
    flash[:notice] = "Event saved"
    if params[:commit] == "Event erstellen"
      respond_with(@event)
    else
      respond_with(@event, :status => :created, :location => new_admin_event_path)
    end
  end

  def copy

    @old_event = Event.find(params[:id])
    @event = @old_event.dup
    @event.save!

    if @event.location.present?
      @selected_location = @event.location_id
    else
      @selected_location = ''
    end
    @selected_program = @event.program_id
    @selected_status = @event.status
    @selected_ptype = @event.ptype

    redirect_to edit_admin_event_url( @event ), notice: "Kopie dieses Event angelegt."

  end

  def update
    @event.update(event_params)
    flash[:notice] = "Event updated"
    respond_with(@event)
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event deleted"
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def set_status
    @switch_id    = "event_switch_#{@event.id}"

    if @event.status == 'Published'
      @event.status = 'Draft'
    else
      @event.status = 'Published'
    end
    @event.save!

    respond_to do |format|
      format.js
    end

  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :shortext, :longtext, :startdate, :enddate, :location_id, :link, :label, :organizer, :organizerlink, :image, :ptype, :status, :program_id, :locationtext, :remove_image)
    end
end
