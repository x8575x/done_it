class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :review


  # 1つのレビューに対していいねは1人1回のバリデーション
  validates :user_id, uniqueness: { scope: :review_id }

end
