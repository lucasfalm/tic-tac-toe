# frozen_string_literal: true

require './game/modes/base.rb'
require './game/helpers/play_as_human.rb'
require './game/modes/human_vs_computer/you_win_message.rb'
require './game/modes/human_vs_computer/game_over_message.rb'

module Modes
  module HumanVsComputer
    module Levels
      class Base < ::Game::Modes::Base
        include Game::Helpers::PlayAsHuman

        include Game::Modes::HumanVsComputer::YouWinMessage
        include Game::Modes::HumanVsComputer::GameOverMessage

        def initialize
          super

          @computer_symbol = X_SYMBOL
          @human_symbol    = O_SYMBOL

          play_as_human(human_symbol)
        end

        private

        attr_reader :computer_symbol, :human_symbol

        def random_move
          random_space = rand(0..available_spaces.count)

          available_spaces[random_space].to_i
        end

        def get_best_move
          best_move = nil

          available_spaces.each do |space|
            #
            # NOTE: faking the movement
            #
            forecast_board             = board.dup
            forecast_board[space.to_i] = computer_symbol

            #
            # NOTE: was the winning movement?
            #
            if win?(forecast_board)
              best_move = space.to_i
            else
              forecast_board[space.to_i] = @human_symbol
              #
              # NOTE: would it be the user winning movement?
              #
              best_move = space.to_i if win?(forecast_board)
            end
          end

          best_move ? best_move : random_move
        end

        def game_result_message
          human_win? ? you_win_message : game_over_message
        end

        def human_win?
          winning_symbol == human_symbol
        end
      end
    end
  end
end
