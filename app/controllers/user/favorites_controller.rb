class  User::FavoritesController < ApplicationController
  layout 'user/application'

  def create
    @review = Review.find(params[:review_id])
    favorite = Favorite.new(review_id: @review.id)
    favorite.user_id = current_user.id
    favorite.save
    render :favorite
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
    render :favorite
  end

end
