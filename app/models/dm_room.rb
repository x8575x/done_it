class DmRoom < ApplicationRecord

   has_many :dm_relationships
   has_many :direct_messages

end
