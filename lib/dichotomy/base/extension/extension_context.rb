module Dichotomy
  module Base
    module Extension
      class ExtensionContext
        attr_accessor :container, :build_manager

        def initialize(container, build_manager)
          @container = container
          @build_manager = build_manager
        end

        def add_registration_observer(klass)
          @container.add_observer(klass)
        end
      end
    end
  end
end
