module Dichotomy
  module Base
    module Managers
      module Builders
        module SubjectBuilder
          class BuildContext
            attr_accessor :strategies, :original_type, :built_type

            def initialize(strategies, type)
              @strategies = strategies
              @original_type = type
              @built_type = nil
            end
          end
        end
      end
    end
  end
end