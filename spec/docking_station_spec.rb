require './lib/docking_station'
require './lib/van'

describe DockingStation do

  let(:station) {DockingStation.new(:capacity => 10)}
  let(:van) {Van.new(:capacity => 10)}

  it "should allow setting default capacity on initialize" do
    expect(station.capacity).to eq(10)
  end

  it "should only release broken bikes to van" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    station.dock(working_bike)
    station.dock(broken_bike)
    station.release_broken(van)
    expect(van.bikes).to eq([broken_bike])
    expect(station.bikes.count).to eq(1)
  end

end
