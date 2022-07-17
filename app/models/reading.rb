class Reading < ApplicationRecord

  belongs_to :book
  belongs_to :user
  
  # 1つの本に対して読んでいる本登録は1人1回のバリデーション
  validates :user_id, uniqueness: { scope: :book_id }

end
