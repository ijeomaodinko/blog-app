class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id].to_i)
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
