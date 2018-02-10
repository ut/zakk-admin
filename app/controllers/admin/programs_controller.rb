class Admin::ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  before_action :authenticate_user!

  # load_and_authorize_resource

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all.order( 'updated_at DESC' )
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
  end

  # GET /programs/new
  def new
    if current_program
      @program = current_program.dup
      @program.title = @program.title+' (copy)'
      @program.current = false
      flash[:notice] = 'Die Werte im Formular sind eine Kopie des aktuellen Programms. (Bilder können nicht mitkopiert werden.)'
    else
      @program = Program.new
    end
    render :new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to admin_programs_url, notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to admin_programs_url, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to admin_programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def sendmail
    @program = Program.find(params[:id])
    if @program
      ProgramsMailer.program_email(@program,current_user.email).deliver_now
      redirect_to admin_program_url(@program), notice: 'Programmvorschau wurde versendet'
    else
      redirect_to root_url, notice: 'Ein Problem ist aufgetreten'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:title, :description, :published, :backgroundcolor, :textcolor1, :textcolor2, :image, :backgroundimage, :remove_backgroundimage, :remove_image, :backgroundimage_credit, :image_credit, :backgroundimage_credit_link, :image_credit_link, :current)
    end
end