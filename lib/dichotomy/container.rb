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

    #methods mixed in from DefaultExtension
    # - register_type(type) : returns Subject
    # - resolve_type(type) : returns Object

    def add_extension(extension)
      @extensions.push(extension)
      extension.initialize_extension(Base::Extension::ExtensionContext.new(self, @build_manager))
    end
  end
end