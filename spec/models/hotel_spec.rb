require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end
    
  describe "relationships" do
    it { should have_many :rooms }
  end
end