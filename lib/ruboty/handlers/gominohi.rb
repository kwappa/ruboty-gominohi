module Ruboty
  module Handlers
    class Gominohi < Base
      on(/gominohi(?<date>\Z|\s+.+)/, name: 'gominohi', description: 'tell what kind of garbage could be collected today.')

      def gominohi(message)
        date = Date.easy_parse(message[:date])
        notification = ::Ruboty::Gominohi::Notification.new(date)
        str = notification.message

        message.reply(str) unless str.nil?
      end
    end
  end
end
