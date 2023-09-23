# frozen_string_literal: true

require './lib/game/modes/base.rb'

require './lib/game/helpers/play_as_human.rb'

module Game
  module Modes
    module HumanVsHuman
      class Executor < ::Game::Modes::Base
        include Game::Helpers::PlayAsHuman

        attr_reader :human_one_symbol, :human_two_symbol

        def initialize
          super

          @human_one_symbol = X_SYMBOL
          @human_two_symbol = O_SYMBOL
        end

        def start
          under_rules do
            play_as_human(human_one_symbol) if can_play_next_round?

            play_as_human(human_two_symbol) if can_play_next_round?
          end

          if win?
            puts "\nhuman symbol '#{winning_symbol}' win!\n"
          else
            puts "\ntie!\n"
          end
        end
      end
    end
  end
end
