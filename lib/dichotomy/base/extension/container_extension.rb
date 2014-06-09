module Dichotomy
  module Base
    module Extension
      class ContainerExtension
        def initialize_extension(extension_context)
          @context = extension_context
          initialize_context
        end

        protected

        def initialize_context

        end
      end
    end
  end
end