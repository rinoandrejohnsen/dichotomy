require 'observer'
require 'dichotomy/extensions/default_extension'
require 'dichotomy/extensions/test_extension'
require 'dichotomy/base/extension/extension_context'
require 'dichotomy/base/managers/build_manager'

module Dichotomy
  class Container
    include Observable

    def initialize
      @build_manager = Base::Managers::BuildManager.new
      @extensions = Array.new
      add_extension(Extensions::DefaultExtension.new)
      add_extension(Extensions::TestExtension.new)
    end

    def add_extension(extension)
      @extensions.push(extension)
      extension.initialize_extension(Base::Extension::ExtensionContext.new(self, @build_manager))
    end

    def method_missing(m, *args, &block)
      symbol = m.to_sym
      type = args[0]
           
      notify(symbol, type)

      @build_manager.build(type)
    end

    def notify(symbol, type)
      changed

      notify_observers(symbol, type)
    end
  end
end