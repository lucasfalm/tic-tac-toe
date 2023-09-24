# frozen_string_literal: true

module Game
  module Modes
    module HumanVsHuman
      module HumanWinMessage
        def human_win_message(symbol)
          puts "\nhuman symbol '#{symbol}' win!\n"
        end
      end
    end
  end
end
