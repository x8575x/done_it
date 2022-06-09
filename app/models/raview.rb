class Raview < ApplicationRecord

  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  # タグ・種類に関するアソシエーション
  belongs_to :type
  belongs_to :long
  has_many :mystery_relationships
  has_many :mysteries, through: :mystery_relationships
  has_many :difficulty_relationships
  has_many :difficulties, through: :difficulty_relationships
  has_many :tag_relationships
  has_many :tags, through: :tag_relationships




  # Viewで使用するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
