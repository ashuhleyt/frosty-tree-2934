require 'rails_helper'

RSpec.describe 'Guest Show' do 
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
  end

  describe 'show page' do 
    it 'when I visit the show page, I see the name, and all of the rooms they stayed in' do 
      visit "/guests/#{@guest_1.id}"
      expect(page).to have_content(@guest_1.name)
      expect(page).to have_content(@room1.suite)
      expect(page).to have_content(@room2.suite)
      expect(page).to have_content(@room3.suite)
      expect(page).to have_content(@room1.rate)
      expect(page).to have_content(@room2.rate)
      expect(page).to have_content(@room3.rate)
      expect(page).to have_content(@hotel1.name)
    end

    it 'I see a form to add a room to the guest' do 
      visit "/guests/#{@guest_1.id}"

      expect(page).to have_content("Enter room id:")
      expect(page).to have_field(:room_id)
      expect(page).to have_button("Submit")

      fill_in(:room_id, with: @room4.id)

      click_button "Submit" 
          
      expect(current_path).to eq("/guests/#{@guest_1.id}")
    end
  end
end