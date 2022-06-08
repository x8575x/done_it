class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end



  private

  def user_params
    params.require(:user).permit(:name, :birthday, :sex, :introduction, :profile_image)
  end

end
