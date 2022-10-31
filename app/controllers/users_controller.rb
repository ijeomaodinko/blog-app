class UsersController < ApplicationController
  def index
    @users = Show.all
  end

  def show
    @user = User.find(params[:id])
  end
end
