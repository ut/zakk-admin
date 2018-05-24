class Admin::FlyersController < Admin::AdminController
  before_action :set_flyer, only: [:edit, :update, :destroy]

  layout 'admin'

  before_action :authenticate_user!

  # GET /flyers
  # GET /flyers.json
  def index
    @flyers = Flyer.all
  end


  # GET /flyers/new
  def new
    @flyer = Flyer.new
  end

  # GET /flyers/1/edit
  def edit
  end

  # POST /flyers
  # POST /flyers.json
  def create
    @flyer = Flyer.new(flyer_params)

    respond_to do |format|
      if @flyer.save
        format.html { redirect_to admin_flyers_path, notice: 'Flyer was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @flyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flyers/1
  # PATCH/PUT /flyers/1.json
  def update
    respond_to do |format|
      if @flyer.update(flyer_params)
        format.html { redirect_to admin_flyers_url, notice: 'Flyer was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @flyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flyers/1
  # DELETE /flyers/1.json
  def destroy
    @flyer.destroy
    respond_to do |format|
      format.html { redirect_to admin_flyers_url, notice: 'Flyer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flyer
      @flyer = Flyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flyer_params
      params.require(:flyer).permit(:image, :title)
    end
end
