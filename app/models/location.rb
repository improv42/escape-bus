class Location < ActiveRecord::Base
  geocoded_by :my_location
  validates :address, :city, presence: true
  after_validation :geocode

  def my_location
    "#{address}, #{city}, GA"
  end
end
