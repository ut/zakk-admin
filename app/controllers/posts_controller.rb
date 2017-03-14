class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  respond_to :html


  def index
    redirect_to program_url(helpers.current_program.id)
  end

  def show
    @pages = Page.where(published: true).where(in_menu: true)
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

end
