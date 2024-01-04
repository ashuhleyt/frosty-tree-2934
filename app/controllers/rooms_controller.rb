class RoomsController < ApplicationController 
  def index 
    @rooms = Room.all
    @hotel = Hotel.all
    @guests = Guest.all
  end
end