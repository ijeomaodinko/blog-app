class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.where(author_id: @user.id).includes(:comments)
    @user = User.find(params[:user_id])
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @user = current_user

    if @post.save
      redirect_to user_path(current_user.id)
      flash[:error] = 'Post successfuly created!'
    else
      flash[:error] = 'Error creating post'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments.includes([:author])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', status: :not_found
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Deleted!' }
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
