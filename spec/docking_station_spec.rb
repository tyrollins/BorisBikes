require 'docking_station'
require 'bike'

describe DockingStation do

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new}

  it 'should be able to accept bike' do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end
end
