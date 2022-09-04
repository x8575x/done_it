class Notification < ApplicationRecord
  
  #スコープ(新着順)
	default_scope->{order(created_at: :desc)}

  belongs_to :review, optional: true
  belongs_to :comment, optional: true
  belongs_to :dm_room, optional: true
  belongs_to :direct_message, optional: true
  belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
	belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

end
