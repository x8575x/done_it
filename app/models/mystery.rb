class Mystery < ApplicationRecord

  has_many :mystery_relationships
  has_many :reviews, through: :mystery_relationships

end
