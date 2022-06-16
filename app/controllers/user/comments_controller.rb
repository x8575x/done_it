class User::CommentsController < ApplicationController
  layout 'user/application'

  def create
    @review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.review_id = @review.id
    comment.save
    render :index
  end

  def destroy
    @review = Review.find(params[:review_id])
    Comment.find(params[:id]).destroy
    render :index
  end



  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
