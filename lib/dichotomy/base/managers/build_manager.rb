require 'dichotomy/base/managers/builder/strategies/staged_strategy_chain'
require 'dichotomy/base/managers/builder/build_stage'
require 'dichotomy/base/managers/builder/build_context'

module Dichotomy
  module Base
    module Managers
      class BuildManager
        attr_reader :strategies, :registered_listeners

        def initialize
          @strategies = Builder::Strategies::StagedStrategyChain.new(Builder::BuildStage)
          @registered_listeners = Array.new
        end

        def add_observer(klass)
          @registered_listeners.push(klass)
        end

        def build(type)
          context = Builder::BuildContext.new(@strategies.make_strategy_chain, type, self)

          @strategies.clear_strategies

          @registered_listeners.each do |klass|
            context.add_observer(klass)
          end

          context.strategies.execute_build_up(context)
        end

        def reset_strategies
          @strategies.clear_strategies
        end
      end
    end
  end
end