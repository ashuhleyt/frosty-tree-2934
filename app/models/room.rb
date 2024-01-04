class Room < ApplicationRecord
  belongs_to :hotel

  has_many :guest_rooms
  has_many :guests, through: :guest_rooms

  validates :suite, presence: true
  validates :rate, presence: true
end