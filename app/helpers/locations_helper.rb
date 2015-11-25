module LocationsHelper
  # Parse the API data to store it in an array of hashes
  # so that each bus is a hash
  def fetch_api_data(source)
    http = Net::HTTP.get_response(URI.parse(source))
    data = http.body
    JSON.parse(data)
  end

  # Compare the user latitude and longitude with a bus
  # to see if it is nearby (within 0.01 degrees lat / lon)
  # TODO: Make this a true circular radius
  # TODO: Give user option of how close
  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    (user_lat - bus_lat).abs <= 0.01 && (user_long - bus_long).abs <= 0.01
  end
end
