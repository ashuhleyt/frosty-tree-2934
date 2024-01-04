class GuestRoomsController < ApplicationController
  def create 
    @room = Room.find(params[:room_id])
    @guest = Guest.find(params[:id])
    @guest_room = GuestRoom.new(guest_id: @guest_id, room_id: @room.id)

    if @guest_room.save
      flash[:notice] = "The Room Was Added To The Guest Room Database"
    else 
      flash[:alert] = "Sorry homie, there is an issue to fix"
    end

    redirect_to "/guests/#{@guest.id}"
  end
end