class ExampleDependencyTwo
  def initialize(dependency, rino)
    @dependency = dependency
    @rino = rino
  end

  def init(tt)
    @dependency.run
    @dependency.pause
    @dependency.stop
  end
end