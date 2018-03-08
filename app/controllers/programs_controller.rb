class ProgramsController < ApplicationController
  before_action :set_program, only: [:show]

  # GET /programs
  # GET /programs.json
  def index
    if current_program && current_program.id
      redirect_to program_url(current_program.id)
    end
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    if current_user || ( current_program && ( params[:id] == "current" ))
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
      if current_program && ( params[:id] == "current" )
        @program = current_program
      else
        @program = Program.find(params[:id])
      end
    end

end
