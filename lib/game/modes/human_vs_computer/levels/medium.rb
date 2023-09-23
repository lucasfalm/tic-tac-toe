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
              position = hard_or_easy(
                symbol: computer_symbol, against_symbol: human_symbol
              ).sample

              if available_move?(board, position)
                @board[position] = computer_symbol

                display_board
              else
                position = nil
              end
            end
          end

          def hard_or_easy(symbol:, against_symbol:)
            [
              get_best_move(symbol: symbol, against_symbol: against_symbol),
              get_random_move
            ]
          end
        end
      end
    end
  end
end
