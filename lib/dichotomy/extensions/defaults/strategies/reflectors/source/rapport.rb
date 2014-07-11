module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        module Reflectors
          module Source
            class Rapport
              attr_accessor :id, :name, :methods, :properties, :dependencies, :filename

              def initialize(name, methods = Array.new, properties = Array.new, dependencies = Hash.new, filename = '')
                @name = name
                @methods = methods
                @properties = properties
                @dependencies = dependencies
                @filename = filename
                @id = rand(36**8).to_s(36) # a simple solution
              end

              def has_dependencies?
                return !@dependencies.empty?
              end
            end
          end
        end
      end
    end
  end
end