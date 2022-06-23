class Tag < ApplicationRecord

  has_many :tag_relationships
  has_many :reviews, through: :tag_relationships

  validates :name, uniqueness: true, presence: true

end
