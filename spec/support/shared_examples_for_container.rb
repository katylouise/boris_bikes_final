shared_examples_for Container do

  it 'raises an error when full' do
    subject.capacity.times{subject.add_vehicle :vehicle}
    expect{subject.add_vehicle :vehicle}.to raise_error "#{described_class.name} full!"
  end

  describe '#capacity' do

    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq Container::DEFAULT_CAPACITY
    end

    it 'can be overwritten on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new(random_capacity)
      expect(subject.capacity).to eq(random_capacity)
    end
  end

  describe '#add_vehicle' do
    it 'responds to add_vehicle' do
      expect(subject).to respond_to(:add_vehicle)
    end

    it 'accepts a vehicle' do
      subject.add_vehicle :vehicle
      expect(subject).not_to be_empty
    end
  end

  describe '#remove_vehicle' do
    before(:each) { subject.add_vehicle :vehicle }

    it 'returns a vehicle' do
      expect(subject.remove_vehicle).to eq :vehicle
    end

    it 'expect to be empty' do
      subject.remove_vehicle
      expect(subject).to be_empty
    end
  end

end