class Mystery < ApplicationRecord

  has_many :mystery_relationships
  has_many :reviews, through: :mystery_relationships
  # accepts_nested_attributes_for :mystery_relationships

  validates :name, uniqueness: true, presence: true

end
