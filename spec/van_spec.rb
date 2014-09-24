require_relative "../lib/docking_station"
require_relative "../lib/van"


describe Van do

  let(:van) {Van.new(:capacity => 10)}
  let(:station) {DockingStation.new(:capacity => 10)}

  it 'should allow default capacity on initialize' do
    expect(van.capacity).to eq(10)
  end

  it 'should only take broken bikes from docking station' do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    station.dock(working_bike)
    station.dock(broken_bike)
    van.accept_broken(station)
    expect(van.bikes).to eq([broken_bike])
    expect(station.bikes.count).to eq(1)
  end
end
