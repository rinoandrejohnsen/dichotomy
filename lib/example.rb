require 'dichotomy'
require 'example_dependency'

dichotomy_container = Dichotomy::Container.new
example_dependency = dichotomy_container.resolve_type(ExampleDependency)

debug = nil