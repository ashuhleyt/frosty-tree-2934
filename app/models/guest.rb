class Guest < ApplicationRecord
  has_many :guest_rooms
  has_many :rooms, through: :guest_rooms

  validates :name, presence: true
  validates :nights, presence: true
end