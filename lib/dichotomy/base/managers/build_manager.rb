require 'dichotomy/base/managers/builders/strategies/staged_strategy_chain'
require 'dichotomy/base/managers/builders/subject_builder/build_stage'
require 'dichotomy/base/managers/builders/object_builder/build_stage'
require 'dichotomy/base/managers/builders/subject_builder/build_context'
require 'dichotomy/base/managers/builders/object_builder/build_context'

module Dichotomy
  module Base
    module Managers
      class BuildManager
        attr_reader :subject_strategies, :object_strategies

        def initialize
          @registered_types = Hash.new
          @subject_strategies = Builders::Strategies::StagedStrategyChain.new(Builders::SubjectBuilder::BuildStage)
          @object_strategies = Builders::Strategies::StagedStrategyChain.new(Builders::ObjectBuilder::BuildStage)
        end

        def build_subject(type)
          context = Builders::SubjectBuilder::BuildContext.new(@subject_strategies.make_strategy_chain, type)
          return context.strategies.execute_build_up(context)
        end

        def build_object(type)
          context = Builders::ObjectBuilder::BuildContext.new(@object_strategies.make_strategy_chain, type)
          return context.strategies.execute_build_up(context)
        end

        def reset_strategies
          @subject_strategies.clear_strategies
          @object_strategies.clear_strategies
        end
      end
    end
  end
end