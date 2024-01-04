require 'rails_helper'

RSpec.describe 'Hotel Show' do 
  before :each do 
    @guest_1 = Guest.create!(name: 'Megan Thee Stallion', nights: 4)
    @hotel1 = Hotel.create!(name: 'Astroworld', location: 'Houston, TX')
    @room1 = Room.create!(rate: 140, suite: "Presidential", hotel_id: @hotel1.id)
    @room2 = Room.create!(rate: 69, suite: "4 Thee Hotties", hotel_id: @hotel1.id)
    @room3 = Room.create!(rate: 240, suite: "H Towns Finest", hotel_id: @hotel1.id)
    @room4 = Room.create!(rate: 500, suite: "Hot Girl Coach Only", hotel_id: @hotel1.id)
    @gr1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room1.id)
    @gr2 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room2.id)
    @gr3 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room3.id)

    visit "/hotels/#{@hotel1.id}"
  end

  it 'I see a list of all guests that have stayed here' do 
    expect(page).to have_content(@guest_1.name)

  end
end 