# frozen_string_literal: true

require './game/modes/human_vs_computer/levels/base.rb'

module Modes
  module HumanVsComputer
    module Levels
      class Easy < Base
        def start
          under_rules do
            play_as_computer

            play_as_human(human_symbol)
          end

          if winning_symbol == human_symbol
            you_win_message
          else
            game_over_message
          end
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

        def get_best_move(depth = 0, best_score = {})
          available_spaces = []

          best_move = nil

          board.each do |space|
            if space != "X" && space != "O"
              #
              # NOTE: position not choosen yet
              #
              available_spaces << space
            end
          end

          random_space = rand(0..available_spaces.count)

          available_spaces[random_space].to_i
        end
      end
    end
  end
end
