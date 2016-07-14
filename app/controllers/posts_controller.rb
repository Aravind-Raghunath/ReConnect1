class PostsController < ApplicationController
  skip_before_action :authenticate_alumnus!

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = @current_alumnus.posts.new
  end

  def create
    @post = Post.new(post_params)
    @post.alumnus = current_alumnus
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title, :description))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :alumnus_id)
  end
end
