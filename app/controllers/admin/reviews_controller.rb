class Admin::ReviewsController < ApplicationController
  layout 'admin/application'

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end


  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_reviews_path
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end



  private


  def review_params
    params.require(:review).permit(
      :book_id,:body, :netabare, :type_id, :long_id,
      # Mystery,Difficulty,Tagの配列で複数保存
      { :mystery_ids => [] }, { :difficulty_ids => [] }, { :tag_ids => [] }
    )
  end

end
