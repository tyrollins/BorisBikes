module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def dock(bike)
    raise "Station is full." if full?
    bikes << bike if bike.instance_of?(Bike)
  end

  def release(bike)
    raise "No bikes available." if empty?
    bikes.delete(bike) if bike.instance_of?(Bike)
  end

  def empty?
    bikes.count == 0
  end

  def full?
    bikes.count == capacity
  end

  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end

  def broken_bikes
    bikes.select {|bike| bike.broken?}
  end

end
