class Admin::UsersController < ApplicationController
  layout 'admin/application'

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集に成功しました"
      redirect_to admin_user_path(@user)
    else
      render :show
    end
  end


  private


  def user_params
    params.require(:user).permit(:is_deleted)
  end

end
