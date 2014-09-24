require './lib/van'
require './lib/garage'


describe Garage do

  let(:garage) {Garage.new(:capacity => 10)}
  let(:van) {Van.new(:capacity => 10)}

  def test_bikes
    @working_bike, @broken_bike = Bike.new, Bike.new
    @broken_bike.break!
  end

  it "should allow setting default capacity on initialize" do
    expect(garage.capacity).to eq(10)
  end

  it "should only accept broken bikes from van" do
    test_bikes
    van.dock(@broken_bike)
    garage.accept_broken(van)
    expect(garage.bikes).to eq([@broken_bike])
    expect(van.bikes.count).to eq(0)
  end

  it "should fix broken bikes" do
    test_bikes
    garage.dock(@broken_bike)
    garage.fix_bikes([@broken_bike])
    expect(@broken_bike).not_to be_broken
  end

  it "should only release fixed bikes to van" do
    test_bikes
    garage.dock(@working_bike)
    garage.release_fixed(van)
    expect(van.bikes).to eq([@working_bike])
    expect(garage.bikes.count).to eq(0)
  end

end
