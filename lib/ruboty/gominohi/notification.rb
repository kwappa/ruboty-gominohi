module Ruboty
  module Gominohi
    class Notification
      attr_reader :date

      def initialize(date = Date.today)
        @date = date
        @yaml = YAML.new
      end

      def search_garbage_collection_days
        @yaml.data[:garbage_collection_days].each_with_object([]) do |day, result|
          next unless day[:wday].include?(@date.wday)
          if !day.key?(:position) || day[:position].include?(@date.wday_position)
            result.push(day)
          end
        end
      end

      def message
        days = search_garbage_collection_days
        unless days.empty?
          result = days.map { |day| format(day) }
          str = if days.count > 1
                  s = result.map { |r| "- #{r}" }.join("\n")
                  "\n#{s}\n"
                else
                  " #{result.first} "
                end

          collectors = if @yaml.data[:garbage_collectors].empty?
                         ''
                       else
                         @yaml.data[:garbage_collectors].map { |name| name.start_with?('@') ? name : "@#{name}" }.join(' ') + ' '
                       end
n
          "#{collectors}#{@date.month}月#{@date.day}日(#{@date.wday_name})のごみ収集は#{str}です。"
        end
      end

      def format(garbage_collection_day)
        "#{garbage_collection_day[:emoticon]} *#{garbage_collection_day[:name]}*"
      end
    end
  end
end
