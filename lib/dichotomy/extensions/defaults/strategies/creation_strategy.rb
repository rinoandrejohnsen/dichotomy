require 'dichotomy/extensions/defaults/strategies/types/subject'

module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        class CreationStrategy
          def pre_build_up(build_context)
            built_type = build_context.built_type

            subject = Types::Subject.new
            subject.name = build_context.original_type.to_s.to_sym
            subject.methods = built_type.methods
            subject.properties = built_type.properties
            subject.dependencies = built_type.dependencies
            subject.filename = built_type.filename
            subject.id = built_type.id

            build_context.built_type = subject
          end

          def post_build_up(build_context)

          end
        end
      end
    end
  end
end