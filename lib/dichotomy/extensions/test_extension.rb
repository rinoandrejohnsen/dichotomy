require 'dichotomy/base/extension/container_extension'
require 'dichotomy/extensions/tests/strategies/default_subject_strategy'

module Dichotomy
  module Extensions
    class TestExtension < Base::Extension::ContainerExtension
      def initialize_context

      end

      def on_register_type(type)
        @context.build_manager.strategies.add(Tests::Strategies::TestSubjectStrategy.new, 1)
      end

      def observed_notifications(symbol, type)
        # catches the event from DefaultStrategy
        if symbol === :register_type
          on_register_type(type)
        end

        #remove me after test
        if symbol === :resolve_type
          on_register_type(type)
        end

        if symbol === :new_build_up
          on_register_type(type)
        end
      end
    end
  end
end