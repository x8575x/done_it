class User::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  layout 'user/application'

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: params[:id]).page(params[:page]).per(10)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def quit
  end

  def withdraw
    @user = User.find(current_user.id)
    if @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
  end

  def time_line
    reviews = Review.where(user_id: [current_user.following_ids])
    wants = Want.where(user_id: [current_user.following_ids])
    readings = Reading.where(user_id: [current_user.following_ids])
    reads = Read.where(user_id: [current_user.following_ids])
    gets = Get.where(user_id: [current_user.following_ids])
    @time_line = (reviews + wants + readings + reads + gets).sort_by{|x| x.created_at}.reverse.last(15)
  end



  private

  def user_params
    params.require(:user).permit(:name, :birthday, :sex, :introduction, :profile_image)
  end

  # ゲストログイン用
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
