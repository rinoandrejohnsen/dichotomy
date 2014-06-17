require 'parser/current'

module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        module Reflectors
          module Source
            class SourceInterpreter < Parser::Rewriter
              def initialize
                @subject = Common::Models::Subject.new('')
              end

              def on_begin(node)
                @node = node

                name = @node.location.expression.source_buffer.name
                @subject.filename = name
                @subject.name = name[/([^\/]+)$/].chomp('.rb')

                find_methods
                #find_dependencies
              end

              def create_subject(buffer, ast)
                self.rewrite(buffer, ast)
                @subject
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
                          @subject.dependencies.push(Common::Models::SubjectDependency.new(arg))
                        end

                        argumentsHash.push(arg)
                      end
                    end

                    @subject.methods.push(Common::Models::SubjectMethod.new(child_node.children[0], argumentsHash))
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