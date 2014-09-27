require 'bike_container'

class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def accept_broken station
    self.put_in(station.broken_bikes)
    station.take_out broken_bikes
  end

  def release_broken garage
    garage.put_in broken_bikes
    self.take_out broken_bikes
  end

  def accept_fixed garage
    self.put_in(garage.available_bikes)
    garage.take_out available_bikes
  end

  def release_fixed station
    station.put_in available_bikes
    self.take_out available_bikes
  end

end
