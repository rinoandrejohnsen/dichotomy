require 'parser/current'
require 'dichotomy/extensions/defaults/strategies/reflectors/source/interpreter'

module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        module Reflectors
          module Source
            class Analyser
              def initialize
                @parser = Parser::CurrentRuby.new
              end

              def analyse(filename)
                buffer = Parser::Source::Buffer.new(filename).read
                ast = @parser.parse(buffer)
                interpreter = Interpreter.new
                rapport = interpreter.create_rapport(buffer, ast)

                @parser.reset
                #p ast

                rapport
              end
            end
          end
        end
      end
    end
  end
end