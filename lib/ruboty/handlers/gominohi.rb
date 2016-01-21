module Ruboty
  module Handlers
    class Gominohi < Base
      on(/gominohi(?<date>\Z|\s+.+)/, name: 'gominohi', description: 'tell what kind of garbage could be collected today.')

      def gominohi(message)
        date = parse_date(message[:date])
        notification = ::Ruboty::Gominohi::Notification.new(date)
        message.reply(notification.message)
      end

      private

      def parse_date(date)
        date = date.strip.downcase
        case date
        when 'today'
          Date.today
        when 'tomorrow'
          Date.today + 1
        when 'yesterday'
          Date.today - 1
        else
          Date.parse(date)
        end
      rescue
        Date.today
      end
    end
  end
end
