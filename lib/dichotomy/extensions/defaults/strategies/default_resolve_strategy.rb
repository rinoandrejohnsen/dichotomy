module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        class DefaultResolveStrategy
          def pre_build_up(build_context)
            puts 'resolve_pre_build_up'

            build_context.new_build_up(Class)
          end

          def post_build_up(build_context)
            puts 'resolve_post_build_up'
          end
        end
      end
    end
  end
end