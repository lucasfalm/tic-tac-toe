# frozen_string_literal: true

require './lib/game/helpers/play_as_human/cli.rb'

module Game
  module Helpers
    module PlayAsHuman
      include ::Game::Helpers::PlayAsHuman::Cli

      def play_as_human(symbol)
        position = nil

        until position
          position = get_human_move(symbol)

          redo if position > board.count - 1
          redo if playable_symbols.include?(board[position])

          @board[position] = symbol
        end

        display_board
      end
    end
  end
end
