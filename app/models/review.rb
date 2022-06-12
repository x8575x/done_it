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




  # Viewで使用するメソッド
  def favorit_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
