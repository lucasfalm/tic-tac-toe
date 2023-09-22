# frozen_string_literal: true

require './game/modes/base.rb'

require './game/helpers/play_as_human.rb'

require './game/modes/human_vs_computer/you_win_message.rb'
require './game/modes/human_vs_computer/game_over_message.rb'

module Game
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
end
