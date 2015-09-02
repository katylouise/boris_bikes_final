require 'docking_station'

describe DockingStation do
  let(:generic_bike) { double(:bike) }
  let(:working_bike){ double(:bike, working?: true) }
  let(:broken_bike){ double(:bike, working?: false) }

  describe "capacity" do
    it "can be verified" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it "can be specified at initialization" do
      random_number = rand(1..100)
      station = DockingStation.new(random_number)
      expect(station.capacity).to eq(random_number)
    end

    it "can be changed" do
      random_number = rand(1..100)
      subject.capacity = random_number
      expect(subject.capacity).to eq random_number
    end
  end

  describe "#release_bike" do
    it "responds to release bike" do
      expect(subject).to respond_to :release_bike
    end

    it "releases working bikes" do
      allow(generic_bike).to receive(:working?){ true }
      subject.dock generic_bike
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it "raises an error when no bikes" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "raises error when attempt to release broken bike" do
      subject.dock(broken_bike)
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  describe "#dock" do
    it "responds to dock" do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "raises error when full" do
      subject.capacity.times{subject.dock(:vehicle)}
      expect {subject.dock(:vehicle)}.to raise_error "Docking station full"
    end
  end

  it_behaves_like Container
end
