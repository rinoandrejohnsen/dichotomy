require 'dichotomy/base/managers/builders/strategies/staged_strategy_chain'
require 'dichotomy/base/managers/builders/subject_builder/build_stage'
require 'dichotomy/base/managers/builders/object_builder/build_stage'
require 'dichotomy/base/managers/builders/subject_builder/build_context'
require 'dichotomy/base/managers/builders/object_builder/build_context'

module Dichotomy
  module Base
    module Managers
      class BuildManager
        attr_reader :strategies, :registered_listeners

        def initialize
          @strategies = Builders::Strategies::StagedStrategyChain.new(Builders::SubjectBuilder::BuildStage)
          @registered_listeners = Array.new
        end

        def add_observer(klass)
          @registered_listeners.push(klass)
        end

        def build(type)
          context = Builders::SubjectBuilder::BuildContext.new(@strategies.make_strategy_chain, type, self)
          @strategies.clear_strategies
          @registered_listeners.each do |klass|
            context.add_observer(klass)
          end

          return context.strategies.execute_build_up(context)
        end

        def reset_strategies
          @strategies.clear_strategies
        end
      end
    end
  end
end