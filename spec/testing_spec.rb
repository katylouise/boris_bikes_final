require 'docking_station'

describe DockingStation do

  it "allows capacity to be specified at initialization" do
    random_number = rand(1..100)
    station = DockingStation.new(random_number)
    expect(station.capacity).to eq(random_number)
  end

end