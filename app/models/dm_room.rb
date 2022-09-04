class DmRoom < ApplicationRecord

   has_many :dm_relationships
   has_many :direct_messages
   has_many :notifications, dependent: :destroy


  def create_notification_dm(current_user, message_id)
    @multiple_entry_records = DmRelationship.where(dm_room_id: id).where.not(user_id: current_user.id)
    @single_entry_record = @multiple_entry_records.find_by(dm_room_id: id)
    notification = current_user.active_notifications.build(
      room_id: id,
      message_id: message_id,
      visited_id: @single_entry_record.user_id,
      action: 'dm'
    )

    notification.save if notification.valid?
  end

end
