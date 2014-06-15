module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        class DefaultRegisterStrategy
          def pre_build_up(build_context)
            puts 'register_pre_build_up'
          end

          def post_build_up(build_context)
            puts 'register_post_build_up'
          end
        end
      end
    end
  end
end