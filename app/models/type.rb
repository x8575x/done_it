class Type < ApplicationRecord

  has_many :reviews

  validates :name, uniqueness: true, presence: true

end
