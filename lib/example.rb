require 'dichotomy'
require 'example_dependency'

dichotomy_container = Dichotomy::Container.new
subject = dichotomy_container.register_type(ExampleDependency)

debug = nil