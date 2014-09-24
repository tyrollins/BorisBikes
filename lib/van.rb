require_relative 'bike_container'

class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def accept_broken(station)
    put_in(station.broken_bikes)
    station.take_out(broken_bikes)
  end

end
