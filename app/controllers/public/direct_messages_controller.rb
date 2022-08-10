class Public::DirectMessagesController < ApplicationController
  before_action :reject_non_related, only: [:show]

  def show
    @user = User.find(params[:id])
    dm_rooms = current_user.dm_relationships.pluck(:dm_room_id)
    user_rooms = DmRelationship.find_by(user_id: @user.id, dm_room_id: dm_rooms)

    unless user_rooms.nil?
      @room = user_rooms.dm_room
    else
      @room = DmRoom.new
      @room.save
      DmRelationship.create(user_id: current_user.id, dm_room_id: @room.id)
      DmRelationship.create(user_id: @user.id, dm_room_id: @room.id)
    end
    @direct_messages = @room.direct_messages
    @message = DirectMessage.new(dm_room_id: @room.id)
  end

  def create
    @message = DirectMessage.new(direct_message_params)
    @message.user_id = current_user.id
    if @message.save
      @room = DmRoom.find(params[:id])
      @direct_messages = @room.direct_messages
      render :create
    end
  end

  private
  def direct_message_params
    params.require(:direct_message).permit(:message, :dm_room_id)
  end

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to user_path(current_user)
    end
  end

end
