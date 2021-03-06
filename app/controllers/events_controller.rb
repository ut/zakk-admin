class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  respond_to :html


  def index
    if helpers.current_program && helpers.current_program.id
      redirect_to program_url(helpers.current_program.id)
    else
      redirect_to root_url
    end
  end

  def show
    @pages = Page.where(published: true).where(in_menu: true)

    if current_user || @event.status == 'Published'
      respond_to do |format|
        format.html { render :show }
      end
    else
      redirect_to root_url, notice: 'Event is not publically available :('
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

end
