require_relative 'bike'
require_relative 'container'

class DockingStation
  include Container

  def release_bike
    select_working_bikes
    raise "No bikes available" if @working_bikes.empty?
    @working_bikes.pop
  end

  def dock bike
    raise "Docking station full" if full?
    vehicles << bike
  end

  private

  def select_working_bikes
    @working_bikes = @vehicles.select{|bike| bike.working?}
  end

end

