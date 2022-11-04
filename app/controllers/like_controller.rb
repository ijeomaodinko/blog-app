class LikesController < ApplicationController
  
  def create
      @user = Post.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @like = Like.new(likes_params)
      @like.author = current_user
      @like.post_id = params[:post_id]
  
      if @like.save
        flash[:success] = 'Liked'
        redirect_to user_post_path(params[:user_id], params[:post_id])
      else
        flash[:error] = 'Something went wrong'
        render 'new'
      end
    end
  
    private
  
    def likes_params
      params.require(:like).permit(:author_id, :post_id)
    end 
end
