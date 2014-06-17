require 'parser/current'

module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        module Reflectors
          module Source
            class SourceAnalyser
              def initialize
                @parser = Parser::CurrentRuby.new
              end

              def analyse(filename)
                buffer = Parser::Source::Buffer.new(filename).read
                ast = @parser.parse(buffer)
                source_interpreter = SourceInterpreter.new
                subject = source_interpreter.create_subject(buffer, ast)

                @parser.reset
                p ast

                subject
              end
            end
          end
        end
      end
    end
  end
end