module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        class DefaultSubjectStrategy
          def pre_build_up(build_context)
            puts "pre_build_up"
          end

          def post_build_up(build_context)
            puts "post_build_up"
          end
        end
      end
    end
  end
end