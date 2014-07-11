require 'dichotomy/extensions/defaults/strategies/reflectors/source/analyser'

module Dichotomy
  module Extensions
    module Defaults
      module Strategies
        module Reflectors
          class ClassReflector
            def initialize
              @analyser = Source::Analyser.new
            end

            def create_rapport(klass)
              source_location = get_source_location(klass)
              rapport = @analyser.analyse(source_location[0]) # perhaps support all files?
              rapport
            end

            private

            def get_source_location(klass)
              source_locations = is_class(klass)
              if source_locations.empty?
                methods = defined_methods(klass)
                raise ArgumentError, (methods.empty? ? "#{klass} has no methods" : "#{klass} only has built-in methods (#{methods.size} in total)")
              end
              source_locations[0]
            end

            def is_class(klass)
              methods = defined_methods(klass)
              file_groups = methods.group_by{|sl| sl[0]}
              file_counts = file_groups.map do |file, sls|
                lines = sls.map{|sl| sl[1]}
                count = lines.size
                line = lines.min
                {file: file, count: count, line: line}
              end
              file_counts.sort_by!{|fc| fc[:count]}
              source_locations = file_counts.map{|fc| [fc[:file], fc[:line]]}
              source_locations
            end

            def defined_methods(klass)
              methods = klass.methods(false).map{|m| klass.method(m)} + klass.instance_methods(false).map{|m| klass.instance_method(m)}
              methods.map!(&:source_location)
              methods.compact!
              methods
            end
          end
        end
      end
    end
  end
end