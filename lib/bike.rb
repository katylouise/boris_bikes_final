class Bike

  attr_reader :broken, :working

  def initialize
    @broken = false
  end

  def working?
    return true unless @broken
  end

  def report_broken
    @broken = true
  end

end