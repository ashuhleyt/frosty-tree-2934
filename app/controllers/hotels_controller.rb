class HotelsController < ApplicationController 
  def show 
    @hotel = Hotel.find(params[:id])
    @guests = @hotel.rooms.flat_map(&:guests).uniq
  end
end