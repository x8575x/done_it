class User::ReviewsController < ApplicationController

  def new
    @review = Review.new
    @isbn = params[:isbn]
  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.save
  end

  def index
    @reviews = Review.all
  end


  private

  def review_params
    params.require(:review).permit(:book_id,:body, :netabare, :type_id, :long_id, { :mystery_ids => [] }, { :difficulty_ids => [] }, { :tag_ids => [] })
  end


end
