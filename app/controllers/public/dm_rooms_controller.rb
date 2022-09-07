class Public::DmRoomsController < ApplicationController

  def index
    rooms = DmRelationship.where(user_id: current_user.id)
    @dm_room = DmRelationship.where(dm_room_id: rooms.ids)
    # @currentEntries = current_user.dm_relationships
    # myDm_RoomIds = []

    # @currentEntries.each do |entry|
    #   myDm_RoomIds << entry.dm_room.id
    # end

    # @anotherEntries = DmRelationship.where(dm_room_id: myDm_RoomIds).where('user_id != ?',@user.id)
  end

end
