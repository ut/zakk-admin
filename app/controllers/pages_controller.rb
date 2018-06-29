class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def show

    @col1_content = Content.where(:page =>@page.id).where(:col => "1")
    @col2_content = Content.where(:page =>@page.id).where(:col => "2")
    @col3_content = Content.where(:page =>@page.id).where(:col => "3")

    @pages = Page.where(published: true).where(in_menu: true)
    @footer_pages = Page.where(published: true).where(in_footer: true)

    if current_user || @page.published == true
      respond_to do |format|
        format.html { render :show }
      end
    else
      redirect_to root_url, notice: 'Event is not publically available :('
    end
  end


  private
    def set_page
      @page = Page.find(params[:id])
    end

end
