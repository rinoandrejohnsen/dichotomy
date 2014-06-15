require 'dichotomy/base/extension/container_extension'
require 'dichotomy/extensions/tests/strategies/default_subject_strategy'

module Dichotomy
  module Extensions
    class TestExtension < Base::Extension::ContainerExtension
      def initialize_context
        @context.add_registration_observer(self)
      end

      def on_register_type(type)
        @context.build_manager.subject_strategies.add(Tests::Strategies::TestSubjectStrategy.new, 1)
      end

      def update(type, symbol)
        # catches the event from DefaultStrategy
        if symbol === :register_type
          on_register_type(type)
        end
      end
    end
  end
end