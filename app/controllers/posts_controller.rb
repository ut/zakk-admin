class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

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
    respond_with(@post)
  end

  def edit
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
