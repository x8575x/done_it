class FollowRelationship < ApplicationRecord
  
  # Class_nameでUserモデル参照
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
end
