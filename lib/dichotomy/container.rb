require 'observer'
require 'dichotomy/extensions/default_extension'
require 'dichotomy/extensions/test_extension'
require 'dichotomy/base/extension/extension_context'
require 'dichotomy/base/managers/build_manager'

module Dichotomy
  class Container
    include Observable

    def initialize
      initialize_state
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

    private

    def initialize_state
      @build_manager = Base::Managers::BuildManager.new
      @extensions = Array.new
    end

    def build_subject(type)
      subject = @build_manager.build_subject(type)
      @build_manager.reset_strategies
      subject
    end

    def build_object(type)
      object = @build_manager.build_object(type)
      @build_manager.reset_strategies
      object
    end
  end
end