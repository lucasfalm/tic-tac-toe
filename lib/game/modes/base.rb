# frozen_string_literal: true

require './lib/game/board.rb'
require './lib/game/rules.rb'
require './lib/game/winning_combinations.rb'
require './lib/game/playable_symbols.rb'

require './lib/game/helpers/display_board.rb'
require './lib/game/helpers/available_spaces.rb'
require './lib/game/helpers/get_best_move.rb'
require './lib/game/helpers/get_random_move.rb'

require './lib/game/helpers/clear_terminal_screen.rb'

module Game
  module Modes
    class Base
      class << self
        #
        # NOTE: by doing this, the child class will be the game
        #
        #       still, it can be overwrited for a custom initialization
        #
        def prepare
          self.new
        end
      end

      include ::Game::Rules
      include ::Game::WinningCombinations
      include ::Game::PlayableSymbols

      include ::Game::Helpers::DisplayBoard
      include ::Game::Helpers::AvailableSpaces
      include ::Game::Helpers::GetBestMove
      include ::Game::Helpers::GetRandomMove

      def initialize
        @board          = ::Game::Board.fresh_new
        @winning_symbol = nil

        display_board
      end

      def start; end

      private

      attr_accessor :board, :winning_symbol
    end
  end
end
