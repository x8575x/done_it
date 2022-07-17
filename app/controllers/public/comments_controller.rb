class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = @review.id
    if @comment.save
      @comments = @review.comments
      render :index
    else
      @comments = @review.comments
      render 'error'
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    Comment.find(params[:id]).destroy
    @comments = @review.comments
    render :index
  end



  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
