require 'yaml'

module Ruboty
  module Gominohi
    class YAML
      YAML_DIRS = [
        Dir.pwd,
        File.join(File.dirname(File.expand_path(__FILE__)), '..', '..', '..')
      ].freeze

      YAML_FILE = '.gominohi.yml'.freeze

      attr_reader :data

      def initialize
        YAML_DIRS.each do |dir|
          filename = File.join(dir, YAML_FILE)
          if File.exists?(filename)
            @data = ::YAML.load(File.read(filename))
            break
          end
        end

        raise "#{YAML_FILE} is not found" if @data.nil?
      end
    end
  end
end
