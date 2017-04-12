class ProgramsController < ApplicationController
  before_action :set_program, only: [:show]

  # GET /programs
  # GET /programs.json
  def index
    if helpers.current_program
      redirect_to program_url(helpers.current_program.id)
    else
      redirect_to root_url
    end
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    if current_user || ( helpers.current_program && ( params[:id] == "current" ))

      respond_to do |format|
        format.xml { render layout: false }
        format.json { render layout: false }
        format.html { render :show }
      end
    else
      redirect_to root_url, notice: 'Program is not publically available :('
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      if helpers.current_program && ( params[:id] == "current" )
        @program = helpers.current_program
      else
        @program = Program.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.fetch(:program, {})
    end
end
