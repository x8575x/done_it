class Tag < ApplicationRecord
  
  has_many :tag_relationships
  has_many :reviews, through: :mystery_relationships
  
end
