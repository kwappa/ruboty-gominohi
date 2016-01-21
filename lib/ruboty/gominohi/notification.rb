module Ruboty
  module Gominohi
    class Notification
      attr_reader :date

      def initialize(date = Date.today)
        @date = date
        @yaml = YAML.new
      end

      def message
        "[WIP] #{@date.strftime('%F')} のごみ収集は…"
      end

      def wday_nth(date)
        (date.day - 1) / 7 + 1
      end
    end
  end
end
