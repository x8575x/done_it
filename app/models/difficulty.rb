class Difficulty < ApplicationRecord

  has_many :difficulty_relationships
  has_many :reviews, through: :difficulty_relationships

end
