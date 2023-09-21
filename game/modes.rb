# frozen_string_literal: true

require './game/modes/human_vs_computer.rb'
require './game/modes/computer_vs_computer.rb'
require './game/modes/human_vs_human.rb'

module Game
  module Modes
    private

    GAME_MODES = {
      1 => ::Game::Modes::ComputerVsComputer,
      2 => ::Game::Modes::HumanVsComputer,
      3 => ::Game::Modes::HumanVsHuman,
    }.freeze

    private_constant :GAME_MODES

    def requested_game_mode
      puts "Choose game mode:"
      puts "  1. computer vs computer \n"
      puts "  2. human vs computer \n"
      puts "  3. human vs human \n"

      gets.chomp.to_i
    end
  end
end
