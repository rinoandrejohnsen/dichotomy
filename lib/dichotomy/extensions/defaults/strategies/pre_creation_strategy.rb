require 'dichotomy/extensions/defaults/strategies/reflectors/class_reflector'

module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        class PreCreationStrategy
          def pre_build_up(build_context)
            original_type = build_context.original_type

            class_reflector = Reflectors::ClassReflector.new

            build_context.built_type = class_reflector.create_rapport(original_type)
          end

          def post_build_up(build_context)

          end
        end
      end
    end
  end
end