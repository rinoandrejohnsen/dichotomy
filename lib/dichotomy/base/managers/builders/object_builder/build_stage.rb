module Dichotomy
  module Base
    module Managers
      module Builders
        module ObjectBuilder
          module BuildStage
            # First stage. By default, nothing happens here.
            SETUP = 0

            #Second stage. Type mapping occurs here.
            TYPE_MAPPING = 1

            # Third stage. lifetime managers are checked here, and if they're available the rest of the pipeline is skipped.
            LIFETIME = 2

            #Fourth stage. Reflection over constructors, properties, etc. is performed here.
            PRE_CREATION = 3

            # Fifth stage. Instance creation happens here.
            CREATION = 4

            # Sixth stage. Property sets and method injection happens here.
            INITIALIZATION = 5

            # Seventh and final stage. By default, nothing happens here.
            POST_INITIALIZATION = 7
          end
        end
      end
    end
  end
end