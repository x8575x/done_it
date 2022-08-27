class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    favorite = Favorite.new(review_id: @review.id)
    favorite.user_id = current_user.id
    favorite.save
    # 通知の作成
    @review.create_notification_favorite!(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
    render 'public/favorites/favorite'
  end


  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
    render 'public/favorites/favorite'
  end

end
