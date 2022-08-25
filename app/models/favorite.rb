class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :review


  # 1つのレビューに対していいねは1人1回のバリデーション
  validates :user_id, uniqueness: { scope: :review_id }
  
  # 通知機能
  def create
    like = current_user.likes.new(review_id: @review.id)
    like.save
    @review = Review.find(params[:review_id])
    #通知の作成
    @review.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

end
