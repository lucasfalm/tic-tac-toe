# frozen_string_literal: true

require './game/modes/base.rb'

require './game/helpers/play_as_human.rb'

module Game
  module Modes
    module HumanVsHuman
      class Executor < ::Game::Modes::Base
        include Game::Helpers::PlayAsHuman

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
            puts "human symbol '#{winning_symbol}' win!"
          else
            puts "tie!"
          end
        end

        private

        attr_reader :human_one_symbol, :human_two_symbol
      end
    end
  end
end
