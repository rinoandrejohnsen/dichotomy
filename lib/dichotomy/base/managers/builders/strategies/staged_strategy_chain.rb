require 'dichotomy/base/managers/builders/strategies/strategy_chain'

module Dichotomy
  module Base
    module Managers
      module Builders
        module Strategies
          class StagedStrategyChain
            def initialize(build_stage)
              @stages = Array.new(build_stage.constants(false).length) { Array.new }
            end

            def add(strategy, build_stage)
              @stages[build_stage].push(strategy)
            end

            def make_strategy_chain
              strategy_chain = StrategyChain.new

              @stages.each do |stage|
                strategy_chain.add_range(stage)
              end

              strategy_chain
            end

            def clear_strategies
              @stages.each do |stage|
                stage.clear
              end
            end
          end
        end
      end
    end
  end
end
