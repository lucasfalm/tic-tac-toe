# frozen_string_literal: true

module Game
  module Helpers
    module GetBestMove
      def get_best_move(symbol:, against_symbol:)
        best_move = nil

        available_spaces.each do |space|
          #
          # NOTE: faking the movement
          #
          forecast_board             = board.dup
          forecast_board[space.to_i] = symbol

          #
          # NOTE: is the winning movement?
          #
          if win?(forecast_board)
            best_move = space.to_i
          else
            forecast_board[space.to_i] = against_symbol
            #
            # NOTE: would it be the user winning movement?
            #
            best_move = space.to_i if win?(forecast_board)
          end
        end

        best_move ? best_move : get_random_move
      end
    end
  end
end
