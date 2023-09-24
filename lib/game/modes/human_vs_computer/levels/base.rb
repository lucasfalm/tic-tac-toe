# frozen_string_literal: true

require './lib/game/modes/base.rb'

require './lib/game/helpers/play_as_human.rb'

require './lib/game/modes/human_vs_computer/messages/you_win_message.rb'
require './lib/game/modes/human_vs_computer/messages/game_over_message.rb'
require './lib/game/messages/tie_message.rb'

module Game
  module Modes
    module HumanVsComputer
      module Levels
        class Base < ::Game::Modes::Base
          class MissingPlayAsComputerMethod < StandardError; end

          include Game::Helpers::PlayAsHuman

          include Game::Modes::HumanVsComputer::Messages::YouWinMessage
          include Game::Modes::HumanVsComputer::Messages::GameOverMessage
          include Game::Messages::TieMessage

          def initialize
            super

            @computer_symbol = X_SYMBOL
            @human_symbol    = O_SYMBOL
          end

          def start
            rounds_under_rules do
              play_as_human(human_symbol) if can_play_next_round?

              play_as_computer if can_play_next_round?
            end

            game_result_message
          end

          private

          attr_reader :computer_symbol, :human_symbol

          #
          # NOTE: must be overwritten according to the level of difficulty
          #
          def play_as_computer
            raise MissingPlayAsComputerMethod
          end

          def game_result_message
            if win?
              human_win? ? you_win_message : game_over_message
            else
              tie_message
            end
          end

          def human_win?
            winning_symbol == human_symbol
          end
        end
      end
    end
  end
end
