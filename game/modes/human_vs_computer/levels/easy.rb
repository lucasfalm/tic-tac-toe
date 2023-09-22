# frozen_string_literal: true

require './game/modes/human_vs_computer/levels/base.rb'

module Game
  module Modes
    module HumanVsComputer
      module Levels
        class Easy < ::Game::Modes::HumanVsComputer::Levels::Base
          def start
            under_rules do
              play_as_human(human_symbol) if can_play_next_round?

              play_as_computer if can_play_next_round?
            end

            game_result_message
          end

          private

          def play_as_computer
            position = nil

            until position
              position = get_random_move

              if available_move?(board, position)
                @board[position] = @computer_symbol

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
