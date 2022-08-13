class DirectMessage < ApplicationRecord

  belongs_to :user
  belongs_to :dm_room

  validates :message, presence: true

end
