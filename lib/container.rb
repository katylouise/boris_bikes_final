module Container
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @vehicles = []
  end

  def add_vehicle vehicle
    raise "#{self.class.name} full!" if full?
    @vehicles << vehicle
  end

  def remove_vehicle
    @vehicles.pop
  end

  def full?
    @vehicles.count >= capacity
  end

  def empty?
    @vehicles.empty?
  end
end