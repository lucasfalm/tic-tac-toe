
# frozen_string_literal: true

module Game
  module Modes
    module ComputerVsComputer
      module PlayAsComputer
        private

        def play_as_computer(symbol:, against_symbol:)
          position = nil

          until position
            position = hard_or_easy.sample

            if available_move?(board, position)
              @board[position] = symbol
            else
              position = nil
            end
          end
        end

        def hard_or_easy
          [
            get_best_move(symbol: symbol, against_symbol: against_symbol),
            get_random_move
          ]
        end
      end
    end
  end
end
