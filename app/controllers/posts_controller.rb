class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  
  def new
    @current_user = current_user
    @post = Post.new
    @post = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    @user = current_user
   
    
    if @post.save
      redirect_to posts_new_path(current_user)
      flash[:error] = 'Post successfuly created!'
    else
      flash[:error] = 'Error creating post'
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
