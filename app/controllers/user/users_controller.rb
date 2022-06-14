class User::UsersController < ApplicationController
  layout 'user/application'

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user.id)
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

end
