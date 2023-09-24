# frozen_string_literal: true

require './lib/game/modes/base.rb'

require './lib/game/helpers/play_as_human.rb'

require './lib/game/modes/human_vs_human/messages/human_win_message.rb'
require './lib/game/messages/tie_message.rb'

module Game
  module Modes
    module HumanVsHuman
      class Executor < ::Game::Modes::Base
        include Game::Helpers::PlayAsHuman

        include Game::Modes::HumanVsHuman::Messages::HumanWinMessage
        include Game::Messages::TieMessage

        attr_reader :human_one_symbol, :human_two_symbol

        def initialize
          super

          @human_one_symbol = X_SYMBOL
          @human_two_symbol = O_SYMBOL
        end

        def start
          play_rounds_under_rules { round }

          if win?
            human_win_message(winning_symbol)
          else
            tie_message
          end
        end

        private

        def round
          play_as_human(human_one_symbol) if can_play_next_round?

          play_as_human(human_two_symbol) if can_play_next_round?
        end
      end
    end
  end
end
