module Dichotomy
  module Base
    module Extension
      class ContainerExtension
        def initialize_extension(extension_context)
          @context = extension_context
          @context.container.add_observer(self)
          @context.build_manager.add_observer(self)
          initialize_context
        end

        def update(symbol, type)
          observed_notifications(symbol, type)
        end

        protected

        def initialize_context
          raise "SubclassResponsibility"
        end

        def observed_notifications(symbol, type)
          raise "SubclassResponsibility"
        end
      end
    end
  end
end