class CommentsController < ApplicationController
    skip_before_action:authenticate_alumnus!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    redirect_to post_path(@post)
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
