class User::CommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.review_id = review.id
    comment.save
    redirect_to review_path(review.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
