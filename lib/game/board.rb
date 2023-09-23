# frozen_string_literal: true

module Game
  module Board
    class << self
      def fresh_new
        [
          "0", "1", "2",
          "3", "4", "5",
          "6", "7", "8",
        ]
      end
    end
  end
end
