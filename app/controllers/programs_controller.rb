class ProgramsController < ApplicationController
  before_action :set_program, only: [:show]

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    respond_to do |format|
      format.xml { render layout: false }
      format.json { render layout: false }
      format.html { render :show }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.fetch(:program, {})
    end
end
