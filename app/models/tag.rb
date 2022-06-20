class Tag < ApplicationRecord
  
  has_many :tag_relationships
  has_many :reviews, through: :mystery_relationships
  
  validates :name, uniqueness: true, presence: true
  validates :introduction, presence: true

end
