module Ruboty
  module Handlers
    class Gominohi < Base
      on(/gominohi/, name: 'gominohi', description: 'tell what kind of garbage could be collected today.')
      def gominohi(message)
        message.reply('[WIP] 今日は燃えるゴミの日です。')
      end
    end
  end
end
