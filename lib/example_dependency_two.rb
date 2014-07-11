class ExampleDependencyTwo
  def initialize(dependency, rino, andre)
    @dependency = dependency
    @rino = rino
    @andre = andre
  end

  def init(tt)
    @dependency.run
    @dependency.pause
    @dependency.stop

    @andre.johnsen
  end
end