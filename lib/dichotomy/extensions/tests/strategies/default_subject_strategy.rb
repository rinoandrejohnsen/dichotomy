module Dichotomy
  module Extensions
    module Tests
      module Strategies
        class TestSubjectStrategy
          def pre_build_up(build_context)
            puts 'test_pre_build_up'
            build_context.built_type = Class.new
          end

          def post_build_up(build_context)
            puts 'test_post_build_up'
          end
        end
      end
    end
  end
end