class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])

    reviews = Review.where(user_id: @user.id)
    wants = Want.where(user_id: @user.id)
    readings = Reading.where(user_id: @user.id)
    reads = Read.where(user_id: @user.id)
    gets = Get.where(user_id: @user.id)
    user_actions = (reviews + wants + readings + reads + gets).sort_by{|x| x.created_at}.last(60).reverse
    @user_actions = Kaminari.paginate_array(user_actions).page(params[:page]).per(15)
  end

  def edit
    @user = current_user
  end

  def update
    if @user = current_user
      @user.update(user_params)
      redirect_to user_path(current_user.id)
    end
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
    time_lines = (reviews + wants + readings + reads + gets).sort_by{|x| x.created_at}.last(60).reverse
    @time_lines = Kaminari.paginate_array(time_lines).page(params[:page]).per(15)
  end



  private

  def user_params
    params.require(:user).permit(:name, :birthday, :sex, :introduction, :profile_image, :mystery_active, :birthday_active, :sex_active)
  end

  # ゲストログイン用
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
