class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @comment = Comment.new(comment_params)
    @author = @comment.author
    @post = @comment.post

    if @comment.save
      redirect_to user_posts_path(@author, @post)
    else
      flash[:error] = 'Error in saving comment'
      render 'posts/new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(current_user), notice: 'Comment deleted!' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
