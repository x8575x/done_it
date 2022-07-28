class DirectMessage < ApplicationRecord

  belongs_to :user
  belongs_to :dm_room

end
