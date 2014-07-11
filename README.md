# Dichotomy

Dichotomy is an Inversion of Control Container for Ruby applications.

Dichotomy provides architectural plumbing that allows you to create and manage application components, and acts as the Application Composition layer.

## The vision

An ioc container should "fuzzy" match dependencies to inject based on what members and method calls are used on the dependencies of a function.

## Other implementations

[@torgeir](https://twitter.com/torgeir) provided the first implementation and did it in JavaScript.

The project can be found here: [fuzzyioc](https://github.com/torgeir/fuzzyioc)


## Features

Dichotomy provides:

* Dependency injection by "fuzzy" matching classes
* Enables you to create container extensions that add functionality to the container.

## Installation

Add this line to your application's Gemfile:

    gem 'dichotomy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dichotomy

## Usage
```ruby
require 'dichotomy'
require 'example_dependency'
require 'example_dependency_two'

dichotomy_container = Dichotomy::Container.new

example_dependency_subject = dichotomy_container.register_type(ExampleDependency)
example_dependency_subject_two = dichotomy_container.register_type(ExampleDependencyTwo)

dichotomy_container.resolve_type(example_dependency_subject_two)
```

## Contributing

1. Fork it ( https://github.com/rinoandrejohnsen/dichotomy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
