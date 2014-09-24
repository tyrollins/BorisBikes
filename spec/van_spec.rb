require_relative "../lib/docking_station"
require_relative "../lib/van"
require_relative "../lib/garage"


describe Van do

  let(:van) {Van.new(:capacity => 10)}
  let(:station) {DockingStation.new(:capacity => 10)}
  let(:garage) {Garage.new(:capacity => 10)}

  def test_bikes
    @working_bike, @broken_bike = Bike.new, Bike.new
    @broken_bike.break!
  end

  it 'should allow default capacity on initialize' do
    expect(van.capacity).to eq(10)
  end

  it 'should only accept broken bikes from docking station' do
    test_bikes
    station.dock(@working_bike)
    station.dock(@broken_bike)
    van.accept_broken(station)
    expect(van.bikes).to eq([@broken_bike])
    expect(station.bikes.count).to eq(1)
  end

  it 'should only accept fixed bikes from garage' do
    test_bikes
    garage.dock(@working_bike)
    garage.dock(@broken_bike)
    van.accept_fixed(garage)
    expect(van.bikes).to eq([@working_bike])
    expect(garage.bikes.count).to eq(1)
  end

  it "should only release broken bikes to garage" do
    test_bikes
    van.dock(@broken_bike)
    van.dock(@working_bike)
    van.release_broken(garage)
    expect(garage.bikes).to eq([@broken_bike])
    expect(van.bikes.count).to eq(1)
  end

  it "should only release fixed bikes to docking station" do
    test_bikes
    van.dock(@broken_bike)
    van.dock(@working_bike)
    station.accept_fixed(van)
    expect(station.bikes).to eq([@working_bike])
    expect(van.bikes.count).to eq(1)
  end


end
