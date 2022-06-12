class  User::FavoritesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    favorite = Favorite.new(review_id: @review.id)
    favorite.user_id = current_user.id
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
    redirect_to request.referer
  end

end
