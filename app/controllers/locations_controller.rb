class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  respond_to :html


  def index
    redirect_to root_url
  end

  def show
    respond_with(@location)
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

end
