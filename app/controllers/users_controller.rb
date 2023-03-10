class UsersController < ApplicationController
  before_action :collect_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "info was successfully updated !"
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def collect_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
