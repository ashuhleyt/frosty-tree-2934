class Hotel < ApplicationRecord
  has_many :rooms

  validates :name, presence: true
  validates :location, presence: true
end