require 'dichotomy'
require 'example_dependency'
require 'example_dependency_two'

dichotomy_container = Dichotomy::Container.new
example_dependency_subject = dichotomy_container.register_type(ExampleDependency)
example_dependency_subject_two = dichotomy_container.register_type(ExampleDependencyTwo)

dichotomy_container.resolve_type(example_dependency_subject_two)

debug = nil