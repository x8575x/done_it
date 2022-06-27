class Report < ApplicationRecord

  belongs_to :user
  belongs_to :review, optional: true
  # タグの作成依頼時はreview_idがないので、optional: trueで空を許可

  validates :comment, presence: true

end
