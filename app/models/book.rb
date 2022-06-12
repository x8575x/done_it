class Book < ApplicationRecord

  has_many :reviews
  has_many :wants, dependent: :destroy
  has_many :reads, dependent: :destroy
  has_many :readings, dependent: :destroy
  has_many :gets, dependent: :destroy


  def want_by?(user)
    wants.exists?(user_id: user.id)
  end

  def read_by?(user)
    reads.exists?(user_id: user.id)
  end

  def reading_by?(user)
    readings.exists?(user_id: user.id)
  end

  def get_by?(user)
    gets.exists?(user_id: user.id)
  end

end
