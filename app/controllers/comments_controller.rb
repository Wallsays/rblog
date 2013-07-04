class CommentsController < ApplicationController

  def create
 	@post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    if @comment.errors.empty?
      redirect_to post_path(@post)
    else
      # error 
    end
  end

  def destroy
	@post = Post.find(params[:post_id])
	@comment = @post.comments.find(params[:id])
	@comment.destroy
	redirect_to post_path(@post)
  end

end
