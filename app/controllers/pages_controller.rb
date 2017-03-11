class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  # GET /pages/1
  # GET /pages/1.json
  def show

    @col1_content = Content.where(:page =>@page.id).where(:col => "1")
    @col2_content = Content.where(:page =>@page.id).where(:col => "2")
    @col3_content = Content.where(:page =>@page.id).where(:col => "3")

    @pages = Page.where(published: true).where(in_menu: true)

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :description, :published, :in_menu)
    end
end
