# frozen_string_literal: true

require './game/modes/base.rb'

require './game/modes.rb'

module Modes
  module HumanVsComputer
    module Levels
      class Base < ::Game::Modes::Base
        def initialize
          super

          @computer_symbol = X_SYMBOL
          @human_symbol    = O_SYMBOL

          puts "Enter [0-8]:"

          get_human_position
        end
      end
    end
  end
end
