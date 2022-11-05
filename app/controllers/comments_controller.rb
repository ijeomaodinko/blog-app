class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    @user = Post.find(params[:user_id])
    @post = Post.find(params[:user_id])
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user
    @comment.post_id = params[:post_id]

    if comments.save
      redirect_to user_post_path(params[:author_id], params[:post_id])
    else
      flash[:error] = 'Error in saving comment'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
