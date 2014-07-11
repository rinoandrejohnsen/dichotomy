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
              end

              def create_rapport(buffer, ast)
                self.rewrite(buffer, ast)
                @rapport
              end

              private

              def find_methods
                @node.children.each do |child_node|
                  if child_node.location.kind_of?(Parser::Source::Map::Definition)
                    if child_node.children[0].eql? :initialize # add check for Symbol
                      if child_node.children[1].children[0] != nil
                        find_dependencies(child_node)
                      end
                    else
                      arguments_hash = Array.new

                      if child_node.children[1].children[0] != nil
                        child_node.children[1].children.each do |argument_variable|
                          arguments_hash.push(argument_variable.children[0])
                        end
                      end

                      @rapport.methods.push({child_node.children[0] => arguments_hash})
                    end
                  end
                end
              end

              def find_dependencies(node)
                node.children[1].children.each_with_index do |dependency_variable, index|
                  if node.children[2]
                    variable = node.children[2].children[index]

                    if (variable.kind_of?(Symbol))
                      @rapport.dependencies[dependency_variable.children[0]] = look_for_methods_on_variable(variable)
                    else
                      if variable.children[0].kind_of?(Symbol)
                        @rapport.dependencies[dependency_variable.children[0]] = look_for_methods_on_variable(variable.children[0])
                      end
                    end
                  end
                end
              end


              def look_for_methods_on_variable(variables)
                methods = Array.new
                @node.children.each do |child_node|
                  if child_node.location.kind_of?(Parser::Source::Map::Definition) && !child_node.children[0].eql?(:initialize)
                    argumentsHash = Array.new

                    child_node.children[2].children.each do |variable|
                      if variable.location.kind_of?(Parser::Source::Map::Send)
                        variable.children[0].children.each do |tt|
                          if tt === variables
                            methods.push({:method => variable.children[1]})
                          end
                        end
                      end
                    end
                  end
                end

                methods
              end
            end
          end
        end
      end
    end
  end
end