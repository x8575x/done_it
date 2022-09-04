class DirectMessage < ApplicationRecord

  belongs_to :user
  belongs_to :dm_room
  has_many :notifications, dependent: :destroy

  validates :message, presence: true

end
