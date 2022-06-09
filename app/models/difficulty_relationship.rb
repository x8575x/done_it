class DifficultyRelationship < ApplicationRecord

  belongs_to :difficulty
  belongs_to  :reviews

end
