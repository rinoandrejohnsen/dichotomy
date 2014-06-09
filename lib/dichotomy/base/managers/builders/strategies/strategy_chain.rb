module Dichotomy
  module Base
    module Managers
      module Builders
        module Strategies
          class StrategyChain
            def initialize
              @strategies = Array.new
            end

            def add(strategy)
              @strategies.push(strategy)
            end

            def add_range(strategy_array)
              strategy_array.each do |strategy|
                @strategies.push(strategy)
              end
            end

            def execute_build_up(build_context)
              @strategies.each do |strategy|
                strategy.pre_build_up(build_context)
              end
              @strategies.each do |strategy|
                strategy.post_build_up(build_context)
              end

              puts 'completed the build'

              build_context.built_type
            end
          end
        end
      end
    end
  end
end