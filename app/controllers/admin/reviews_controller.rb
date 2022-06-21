class Admin::ReviewsController < ApplicationController
  layout 'admin/application'

  def index
    @reviews = Review.all.page(params[:page]).per(20)
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end


  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "編集に成功しました"
      redirect_to admin_review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to admin_reviews_path
    else
      render :edit
    end
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
