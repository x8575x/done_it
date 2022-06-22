class  User::FavoritesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    favorite = Favorite.new(review_id: @review.id)
    favorite.user_id = current_user.id
    favorite.save
    render 'user/favorites/favorite'
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
    render 'user/favorites/favorite'
  end

end
