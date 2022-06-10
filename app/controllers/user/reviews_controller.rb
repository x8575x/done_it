class User::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.book_id = params[:isbn]
    review.save!
  end



  private

  def review_params
    params.permit(:body, :netabare, :type_id, :long_id, :mystery_relationship_id, :difficulty_relationship_id, :tag_relationship_id)
  end


end
