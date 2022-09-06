class Public::DmRoomsController < ApplicationController

  def index
    @rooms = current_user.dm_rooms
  end

end
