require 'observer'

module Dichotomy
  module Base
    module Managers
      module Builder
        class BuildContext
          include Observable

          attr_accessor :strategies, :original_type, :built_type, :registered_types

          def initialize(strategies, type, build_manager, types)
            @strategies = strategies
            @original_type = type
            @built_type = nil
            @build_manager = build_manager
            @registered_types = types
          end

          def new_build_up(type)
            #notify the build_manager that a new build is happening
            changed

            #submit the type and method name called, so the extensions can add
            #the appropriate strategy for the change
            notify_observers(:new_build_up, type)

            context = Builder::BuildContext.new(@build_manager.strategies.make_strategy_chain, type, @build_manager, @registered_types)
            @build_manager.registered_listeners.each do |klass|
              context.add_observer(klass)
            end

            return context.strategies.execute_build_up(context)
          end
        end
      end
    end
  end
end