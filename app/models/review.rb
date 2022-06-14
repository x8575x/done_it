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
  
  
  
  scope :review_search, -> (search_params) do
    return if search_params.blank?
    room_type_in(search_params[:room])
      .star_in(search_params[:star])
      .age_in(search_params[:age])
      .sex_in(search_params[:sex])
    end
    
  scope :room_type_in, -> (room) { where(room_id: room.map{|n| n.to_i}) if room.present? }
  scope :star_in, -> (star) { where(star: star) if star.present? }
  scope :age_in, -> (age) { where(age: age) if age.present? }
  scope :sex_in, -> (sex) { where(sex: sex) if sex.present? }

end
