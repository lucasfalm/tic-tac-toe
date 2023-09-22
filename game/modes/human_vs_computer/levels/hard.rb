# frozen_string_literal: true

require './game/modes/human_vs_computer/levels/base.rb'

module Modes
  module HumanVsComputer
    module Levels
      class Hard < Base
        def start
          under_rules do
            play_as_computer if can_play_next_round?

            play_as_human(human_symbol) if can_play_next_round?
          end

          game_result_message
        end

        private

        attr_reader :computer_symbol, :human_symbol

        def play_as_computer
          position = nil

          until position
            position = get_best_move

            #
            # NOTE: validating possible position
            #
            if available_move?(board, position)
              @board[position] = @computer_symbol

              display_board
            else
              #
              # NOTE: has already a symbol there (wrong movement - retrying)
              #
              # NOTE: useless piece of code - position would already be nil (auto-retry)
              #
              position = nil
            end
          end
        end

        #
        # NOTE: playing auto as computer
        #
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

          best_move ? best_move : random_computer_move
        end
      end
    end
  end
end
