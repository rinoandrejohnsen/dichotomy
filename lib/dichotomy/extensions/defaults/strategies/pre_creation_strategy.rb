module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        class PreCreationStrategy
          def pre_build_up(build_context)
            puts 'PreCreationStrategy_pre_build_up'
          end

          def post_build_up(build_context)
            puts 'PreCreationStrategy_post_build_up'
          end
        end
      end
    end
  end
end