class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

   before_action :authenticate_user!,
      :only => [:index,:new,:edit,:create,:update,:destroy]


  def index

    # TODO: show only posts not older than 1 month
    @posts = Post.all
    @grid = PostsGrid.new(params[:posts_grid]) do |scope|
      scope.page(params[:page])
    end
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new

    @selected_location = helpers.default_location_id
    @selected_program = helpers.current_program_id
    @selected_status = helpers.default_status
    @selected_ptype = helpers.default_ptype

    require 'uri'

    if params[:program]
      puts params[:program]
      @selected_program = URI.unescape(params[:program])
    end

    if params[:ptype]
      puts params[:ptype]
      @selected_ptype = params[:ptype].to_i
    end

    respond_with(@post)
  end

  def edit

    if @post.location.present?
      @selected_location = @post.location_id
    else
      @selected_location = ''
    end
    @selected_program = @post.program_id
    @selected_status = @post.status
    @selected_ptype = @post.ptype

  end

  def create
    @post = Post.new(post_params)
    @post.save
    flash[:notice] = "Post saved"
    if params[:commit] == "Post erstellen"
      respond_with(@post)
    else

      respond_with(@post, :status => :created, :location => new_post_path)
    end
  end

  def update
    @post.update(post_params)
    flash[:notice] = "Post updated"
    respond_with(@post)
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post deleted"
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :shortext, :longtext, :startdate, :enddate, :location_id, :link, :label, :organizer, :organizerlink, :image, :ptype, :status, :program_id, :locationtext, :remove_image)
    end
end
