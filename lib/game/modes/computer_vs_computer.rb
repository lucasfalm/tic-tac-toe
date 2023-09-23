# frozen_string_literal: true

require './lib/game/modes/computer_vs_computer/executor.rb'

module Game
  module Modes
    module ComputerVsComputer
      class << self
        def configure_game
          ::Game::Modes::ComputerVsComputer::Executor.configure_game
        end
      end
    end
  end
end
