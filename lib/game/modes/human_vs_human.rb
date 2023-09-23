# frozen_string_literal: true

require './lib/game/modes/human_vs_human/executor.rb'

module Game
  module Modes
    module HumanVsHuman
      class << self
        def configure_game
          ::Game::Modes::HumanVsHuman::Executor.prepare
        end
      end
    end
  end
end
