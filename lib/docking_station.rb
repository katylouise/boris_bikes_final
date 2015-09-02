require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize (capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def select_working_bikes
    @working_bikes = @bikes.select{|bike| bike.working?}
  end

  def release_bike
    select_working_bikes
    raise "No bikes available" if @working_bikes.empty?
    @working_bikes.pop
  end

  def dock bike
    raise "Docking station full" if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end
end

