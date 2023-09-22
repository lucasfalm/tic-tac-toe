# frozen_string_literal: true

module Game
  module Helpers
    module PlayAsHuman
      def play_as_human(symbol)
        position = nil

        until position
          puts "play with symbol '#{symbol}' - enter [0-8]:"
          position = gets.chomp.to_i

          #
          # NOTE: validation of the symbol inputed by the user
          #
          if !playable_symbols.include?(board[position])
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
