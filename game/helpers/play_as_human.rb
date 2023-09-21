# frozen_string_literal: true

module Game
  module Helpers
    module PlayAsHuman
      def play_as_human(symbol)
        position = nil

        until position
          position = gets.chomp.to_i
          #
          # NOTE: validation of the symbol inputed by the user
          #
          if board[position] != "X" && board[position] != "O"
            @board[position] = symbol
          else
            #
            # NOTE: symbol does not exist (not possible symbol)
            #
            # TODO: improve error handling for invalid entries (ask for a new symbol)
            #
            position = nil
          end
        end

        display_board
      end
    end
  end
end
