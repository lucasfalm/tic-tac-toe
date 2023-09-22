
# frozen_string_literal: true

module Game
  module Modes
    module ComputerVsComputer
      module PlayAsComputer
        def play_as_computer(symbol:, against_symbol:)
          position = nil

          until position
            hard_or_easy = [
              get_best_move(symbol: symbol, against_symbol: against_symbol),
              get_random_move
            ]

            position = hard_or_easy.sample

            if available_move?(board, position)
              @board[position] = symbol
            else
              position = nil
            end
          end
        end
      end
    end
  end
end
