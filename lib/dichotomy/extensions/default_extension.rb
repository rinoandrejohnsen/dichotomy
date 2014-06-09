require 'dichotomy/base/extension/container_extension'
require 'dichotomy/extensions/defaults/extension_methods'
require 'dichotomy/extensions/defaults/strategies/default_subject_strategy'

module Dichotomy
  module Extensions
    class DefaultExtension < Base::Extension::ContainerExtension
      def initialize_context
        @context.add_registration_observer(self)
        @context.container.extend(Defaults::ExtensionMethods)
      end

      def on_register_type(type)
        @context.build_manager.subject_strategies.add(Defaults::Strategies::DefaultSubjectStrategy.new, 1)
      end

      def on_resolve_type(type)
        @context.build_manager.object_strategies.add("rino", 0)
      end

      def update(type, symbol)
        if symbol === :register_type
          on_register_type(type)
        end

        if symbol === :resolve_type
          on_resolve_type(type)
        end
      end
    end
  end
end