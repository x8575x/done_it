class Review < ApplicationRecord

  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # タグ・種類に関するアソシエーション
  belongs_to :type
  belongs_to :long

  # Review - MysteryRelationship - Mysteryのアソシエーション
  has_many :mystery_relationships
  has_many :mysteries, through: :mystery_relationships

  # Review - DifficultyRelationship - Difficultyのアソシエーション
  has_many :difficulty_relationships
  has_many :difficulties, through: :difficulty_relationships

  # Review - Tag -TagRelationshipのアソシエーション
  has_many :tag_relationships
  has_many :tags, through: :tag_relationships
  
  # 新規作成依頼のアソシエーション
  has_many :reports
  
  # 通知機能のアソシエーション
  has_many :notifications, dependent: :destroy

  # Viewで使用するメソッド
  def favorit_by?(user)
    favorites.exists?(user_id: user.id)
  end

  scope :search, -> (search_params) do
    return if search_params.blank?

    value = includes(:mysteries, :difficulties, :tags)
    .type(search_params[:type_id])
      .long(search_params[:long_id])
      .mystery(search_params[:mystery_ids])
      .difficulty(search_params[:difficulty_ids])
      .tag(search_params[:tag_ids])
    return value
  end

  scope :type, -> (type_id) { where("type_id = ?", type_id) if type_id.present?}
  scope :long, -> (long_id) { where("long_id = ?", long_id) if long_id.present?}

  scope :mystery, -> (mystery_ids) { where(mysteries: {id: mystery_ids}) if mystery_ids.present?}
  scope :difficulty, -> (difficulty_ids) { where(difficulties: {id: difficulty_ids}) if difficulty_ids.present?}
  scope :tag, -> (tag_ids) { where(tags: {id: tag_ids}) if tag_ids.present?}



  # 通知機能メソッド

      def create_notification_by(current_user)
	    notification = current_user.active_notifications.new(
	      item_id: id,
	      visited_id: user_id,
	      action: "like"
	    )
	    notification.save if notification.valid?
  	end

  	def create_notification_comment!(current_user, comment_id)
	    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
	    temp_ids = Comment.select(:user_id).where(item_id: id).where.not(user_id: current_user.id).distinct
	    temp_ids.each do |temp_id|
	        save_notification_comment!(current_user, comment_id, temp_id['user_id'])
        end
    	# まだ誰もコメントしていない場合は、投稿者に通知を送る
    	save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  	def save_notification_comment!(current_user, comment_id, visited_id)
        # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = current_user.active_notifications.new(
          item_id: id,
          comment_id: comment_id,
          visited_id: visited_id,
          action: 'comment'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visiter_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
     end






end
