require 'dichotomy'
require 'example_dependency'

dichotomy_container = Dichotomy::Container.new
object = dichotomy_container.resolve_type(ExampleDependency)

debug = nil