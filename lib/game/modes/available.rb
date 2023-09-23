# frozen_string_literal: true

require './lib/game/modes/human_vs_computer.rb'
require './lib/game/modes/computer_vs_computer.rb'
require './lib/game/modes/human_vs_human.rb'

module Game
  module Modes
    module Available
      GAME_MODES_AVAILABLE = {
        "computer vs computer" => ::Game::Modes::ComputerVsComputer,
        "human vs computer"    => ::Game::Modes::HumanVsComputer,
        "human vs human"       => ::Game::Modes::HumanVsHuman,
      }.freeze
    end
  end
end
