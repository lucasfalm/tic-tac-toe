# frozen_string_literal: true

require './game/modes/base.rb'
require './game/helpers/play_as_human.rb'

module Modes
  module HumanVsComputer
    module Levels
      class Base < ::Game::Modes::Base
        include Game::Helpers::PlayAsHuman

        def initialize
          super

          @computer_symbol = X_SYMBOL
          @human_symbol    = O_SYMBOL

          puts "Enter [0-8]:"

          play_as_human(human_symbol)
        end

        private

        attr_reader :computer_symbol, :human_symbol
      end
    end
  end
end
