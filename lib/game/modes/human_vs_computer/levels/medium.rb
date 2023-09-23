# frozen_string_literal: true

require './lib/game/modes/human_vs_computer/levels/base.rb'

module Game
  module Modes
    module HumanVsComputer
      module Levels
        class Medium < ::Game::Modes::HumanVsComputer::Levels::Base          
          private

          def play_as_computer
            position = nil

            until position
              hard_or_easy = [
                get_best_move(symbol: computer_symbol, against_symbol: human_symbol),
                get_random_move
              ]

              position = hard_or_easy.sample

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