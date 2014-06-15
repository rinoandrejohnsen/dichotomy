module Dichotomy
  module Base
    module Extension
      class ExtensionContext
        attr_accessor :container, :build_manager

        def initialize(container, build_manager)
          @container = container
          @build_manager = build_manager
        end
      end
    end
  end
end
