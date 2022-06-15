class Admin::UsersController < ApplicationController
  layout 'admin/application'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_users_path
  end



  private


  def user_params
    params.require(:user).permit(:is_deleted)
  end

end
