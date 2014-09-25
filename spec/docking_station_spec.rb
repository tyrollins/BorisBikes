require './lib/docking_station'
require './lib/van'

describe DockingStation do

  let(:station) {DockingStation.new(:capacity => 10)}
  let(:van) {Van.new(:capacity => 10)}

  def test_bikes
    @working_bike, @broken_bike = Bike.new, Bike.new
    @broken_bike.break!
  end

  it "should allow setting default capacity on initialize" do
    expect(station.capacity).to eq(10)
  end

  it "should only release broken bikes to van" do
    test_bikes
    station.dock(@working_bike)
    station.dock(@broken_bike)
    station.release_broken(van)
    expect(van.bikes).to eq([@broken_bike])
    expect(station.bikes.count).to eq(1)
  end

  it "should only accept fixed bikes from van" do
    test_bikes
    van.dock(@working_bike)
    van.dock(@broken_bike)
    station.accept_fixed(van)
    expect(station.bikes).to eq([@working_bike])
    expect(station.bikes.count).to eq(1)
  end

end
