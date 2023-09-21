# frozen_string_literal: true

require './game/modes/human_vs_computer/levels/easy.rb'
require './game/modes/human_vs_computer/levels/medium.rb'
require './game/modes/human_vs_computer/levels/hard.rb'

module Game
  module Modes
    module HumanVsComputer
      class << self
        def initialize_game
          puts "Choose level:"
          puts "  1. easy \n"
          puts "  2. medium \n"
          puts "  3. hard \n"

          requested_level = gets.chomp.to_i

          {
            1 => ::Modes::HumanVsComputer::Levels::Easy,
            2 => ::Modes::HumanVsComputer::Levels::Medium,
            3 => ::Modes::HumanVsComputer::Levels::Hard,
          }.dig(requested_level)&.new
        end
      end
    end
  end
end
