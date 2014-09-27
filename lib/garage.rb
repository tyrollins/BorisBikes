require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
   self.capacity = options.fetch(:capacity, capacity)
  end

  def fix_bikes bikes
    bikes.each &:fix!
  end

  def accept_broken van
    self.put_in van.broken_bikes
    van.take_out broken_bikes
    fix_bikes broken_bikes
  end

  def release_fixed van
    van.put_in available_bikes
    self.take_out available_bikes
  end

end
