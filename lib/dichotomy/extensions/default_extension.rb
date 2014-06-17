require 'dichotomy/base/extension/container_extension'
require 'dichotomy/extensions/defaults/extension_methods'
require 'dichotomy/extensions/defaults/strategies/pre_creation_strategy'
require 'dichotomy/extensions/defaults/strategies/default_resolve_strategy'
require 'dichotomy/base/managers/builder/build_stage'

module Dichotomy
  module Extensions
    class DefaultExtension < Base::Extension::ContainerExtension
      def initialize_context
        @context.container.extend(Defaults::ExtensionMethods)
      end

      def observed_notifications(symbol, type)
        if symbol === :register_type
          on_register_type(type)
        end

        if symbol === :resolve_type
          #if type == subject -> build_object
          #if type != subject -> build_subject -> build_object

          on_resolve_type(type)
        end

        if symbol === :new_build_up
          on_register_type(type) # by example
        end
      end

      def on_register_type(type)
        @context.build_manager.strategies.add(Defaults::Strategies::PreCreationStrategy.new, Base::Managers::Builder::BuildStage::PRE_CREATION)
      end

      def on_resolve_type(type)
        @context.build_manager.strategies.add(Defaults::Strategies::DefaultResolveStrategy.new, Base::Managers::Builder::BuildStage::PRE_CREATION)
      end
    end
  end
end