class Report < ApplicationRecord

  belongs_to :user
  belongs_to :review, optional: true
  # タグの作成依頼時はreview_idがないので、optional: trueで空を許可

  validates :comment, presence: true

  def category?
    if category == 1
      "タグの作成依頼"
    elsif category == 2
      'ネタバレを含む内容が通常の感想記入欄にある'
    elsif category == 3
      '攻撃的な内容が含まれる'
    elsif category == 4
      '差別的な内容が含まれている'
    elsif category == 5
      '不快な内容が含まれている'
    elsif category == 6
      '法令に違反内容が含まれている'
    else
      'その他'
    end
  end


end
