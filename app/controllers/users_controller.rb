class UsersController < ApplicationController
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
      redirect_to edit_user_path
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
end
