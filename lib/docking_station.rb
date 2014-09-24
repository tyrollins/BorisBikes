require_relative 'bike_container'

class DockingStation

  include BikeContainer

  def initialize(options = {})
   self.capacity = options.fetch(:capacity, capacity)
  end

  def release_broken(van)
    van.put_in(broken_bikes)
    self.take_out(broken_bikes)
  end

  def accept_fixed(van)
    self.put_in(van.available_bikes)
    van.take_out(available_bikes)
  end

end
