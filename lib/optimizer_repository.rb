class OptimizerRepository
  Optimizer = Struct.new(:name, :locator)
  OPTIMIZERS = []

  def self.all
    OPTIMIZERS
  end

  def self.register(name, locator)
    OPTIMIZERS << Optimizer.new(name, locator)
  end
end
