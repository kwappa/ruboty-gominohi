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
            @data = deep_symbolize_keys(::YAML.load(File.read(filename)))
            break
          end
        end

        raise "#{YAML_FILE} is not found" if @data.nil?

        yaml_version     = parse_and_truncate_patch_version(@data[:version])
        gominohi_version = parse_and_truncate_patch_version(::Ruboty::Gominohi::VERSION)
        raise 'version of `.gominohi.yml` is invalid' unless yaml_version == gominohi_version
      end

      private

      def parse_and_truncate_patch_version(version_string)
        version_ints = version_string.split('.').map(&:to_i).slice(0..1)
      end

      def symbolize_keys(hash)
        hash.each_with_object({}) { |(k, v), result| result[k.to_sym] = v }
      end

      def deep_symbolize_keys(obj)
        obj.to_hash.keys.each do |key|
          case (v = obj.delete(key))
          when Hash
            v = symbolize_keys(v)
          when Array
            v = v.map{ |x| (symbolize_keys(x) rescue x) }
          end
          obj[(key.to_sym rescue key) || key] = v
        end
        obj
      end
    end
  end
end
