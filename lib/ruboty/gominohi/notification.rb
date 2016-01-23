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
    end
  end
end
