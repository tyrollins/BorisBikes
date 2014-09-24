require './lib/docking_station'
require './lib/van'

describe DockingStation do

  let(:station) {DockingStation.new(:capacity => 10)}
  let(:van) {Van.new(:capacity => 10)}

  it "should allow setting default capacity on initialize" do
    expect(station.capacity).to eq(10)
  end



end
