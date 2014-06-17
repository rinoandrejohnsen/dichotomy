require 'parser/current'
require 'dichotomy/extensions/defaults/strategies/reflectors/source/rapport'

module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        module Reflectors
          module Source
            class Interpreter < Parser::Rewriter
              def initialize
                @rapport = Rapport.new('')
              end

              def on_begin(node)
                @node = node

                name = @node.location.expression.source_buffer.name
                @rapport.filename = name
                @rapport.name = name[/([^\/]+)$/].chomp('.rb')

                find_methods
                #find_dependencies
              end

              def create_rapport(buffer, ast)
                self.rewrite(buffer, ast)
                @rapport
              end

              private

              def find_methods
                @node.children.each do |child_node|
                  if child_node.location.kind_of?(Parser::Source::Map::Definition)
                    arguments_node = child_node.children[1]

                    argumentsHash = Array.new

                    arguments_node.children.each do |args_child_node|
                      args_child_node.children.each do |arg|
                        if child_node.children[0].eql? :initialize # add check for Symbol
                          @rapport.dependencies.push(arg)
                        end

                        argumentsHash.push(arg)
                      end
                    end

                    @rapport.methods.push({child_node.children[0] => argumentsHash})
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end