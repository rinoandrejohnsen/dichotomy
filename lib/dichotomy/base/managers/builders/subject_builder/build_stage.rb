module Dichotomy
  module Base
    module Managers
      module Builders
        module SubjectBuilder
          module BuildStage
            # First stage. By default, nothing happens here.
            SETUP = 0

            # Second stage. Reflection over constructors, properties, etc. is performed here.
            PRE_CREATION = 1

            # Third stage. Instance creation happens here.
            CREATION = 2

            # Fourth stage. Property sets and method injection happens here.
            INITIALIZATION = 3

            # Fifth and final stage. By default, nothing happens here.
            POST_INITIALIZATION = 4
          end
        end
      end
    end
  end
end