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

end
