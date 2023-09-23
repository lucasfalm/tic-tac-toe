# frozen_string_literal: true

require './game/modes/human_vs_computer/levels/base.rb'

module Game
  module Modes
    module HumanVsComputer
      module Levels
        class Hard < ::Game::Modes::HumanVsComputer::Levels::Base
          private

          def play_as_computer
            position = nil

            until position
              position = get_best_move(symbol: computer_symbol, against_symbol: human_symbol)

              if available_move?(board, position)
                @board[position] = computer_symbol

                display_board
              else
                position = nil
              end
            end
          end
        end
      end
    end
  end
end
