class User::FollowRelationshipsController < ApplicationController
  before_action :authenticate_user!

  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
    render "user/follow_relationships/follow_btn"
  end

  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])
    render "user/follow_relationships/follow_btn"
  end

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
