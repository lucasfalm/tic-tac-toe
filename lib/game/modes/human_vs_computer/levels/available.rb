# frozen_string_literal: true

require './lib/game/modes/human_vs_computer/levels/easy.rb'
require './lib/game/modes/human_vs_computer/levels/medium.rb'
require './lib/game/modes/human_vs_computer/levels/hard.rb'

module Game
  module Modes
    module HumanVsComputer
      module Levels
        module Available
          HUMAN_VS_COMPUTER_AVAILABLE_LEVELS = {
            "easy"   => ::Game::Modes::HumanVsComputer::Levels::Easy,
            "medium" => ::Game::Modes::HumanVsComputer::Levels::Medium,
            "hard"   => ::Game::Modes::HumanVsComputer::Levels::Hard,
          }.freeze
        end
      end
    end
  end
end
