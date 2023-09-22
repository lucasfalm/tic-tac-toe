# frozen_string_literal: true

require './game/modes/human_vs_computer/levels/base.rb'

module Modes
  module HumanVsComputer
    module Levels
      class Hard < Base
        def start
          under_rules do
            play_as_computer

            play_as_human(human_symbol)
          end

          # TODO: check if human won
          puts "game over"
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
        # TODO: improve level selection (use depth and best_score)
        #
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
              if win?(forecast_board)
                best_move = space.to_i
              end
            end
          end

          #
          # NOTE: computer winning movement OR human possible winning movement
          #
          if best_move
            return best_move
          else
            #
            # NOTE: wouldn't make a win movement, and wouldn't directly impact the user
            #
            # TODO: improve level selection
            #
            n = rand(0..available_spaces.count)
            return available_spaces[n].to_i
          end
        end
      end
    end
  end
end
