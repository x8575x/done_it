class Public::DmRoomsController < ApplicationController

  def index
    rooms = DmRelationship.where(user_id: current_user.id)
    my_room_id = []
    rooms.each do |entry|
      my_room_id << entry.dm_room.id
    end
    @another_entries = DmRelationship.where(dm_room_id: my_room_id).where.not(user_id: current_user.id).reverse
    another = DmRelationship.where(dm_room_id: my_room_id)
    @massege = DirectMessage.where(dm_room_id: another)
  end

end
