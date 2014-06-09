module Dichotomy
  module Extensions
    module Defaults
      module ExtensionMethods
        def register_type(type)
          #notify the extensions that a change has occurred
          changed

          #submit the type and method name called, so the extensions can add
          #the appropriate strategy for the change
          notify_observers(type, :register_type)

          #all the strategies are now added to the build manager from all the extensions
          build_subject(type)
        end

        def resolve_type(type)
          #notify the extensions that a change has occurred
          changed

          #submit the type and method name called, so the extensions can add
          #the appropriate strategy for the change
          notify_observers(type, :register_type)

          #all the strategies are now added to the build manager from all the extensions
          build_object(type)
        end
      end
    end
  end
end