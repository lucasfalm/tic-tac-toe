# frozen_string_literal: true

require './lib/game/modes/human_vs_computer/levels/easy.rb'
require './lib/game/modes/human_vs_computer/levels/medium.rb'
require './lib/game/modes/human_vs_computer/levels/hard.rb'

require './lib/game/helpers/clear_terminal_screen.rb'

module Game
  module Modes
    module HumanVsComputer
      class InvalidLevelOption < StandardError
        def initialize(message = "invalid level option")
          super
        end
      end

      class << self
        def configure_game
          requested_level = choose_level_prompt
          requested_level.configure_game

        rescue InvalidLevelOption then retry
        end

        private

        LEVELS = {
          "easy"   => ::Game::Modes::HumanVsComputer::Levels::Easy,
          "medium" => ::Game::Modes::HumanVsComputer::Levels::Medium,
          "hard"   => ::Game::Modes::HumanVsComputer::Levels::Hard,
        }.freeze

        private_constant :LEVELS

        def choose_level_prompt
          ::Game::Helpers::ClearTerminalScreen.call

          puts "choose level:"
          LEVELS.each_with_index do |(level_name, _level_klass), index|
            puts "#{index}. #{level_name}"
          end

          level_option_index = gets.chomp.to_i

          raise InvalidLevelOption unless LEVELS.values.at(level_option_index)

          LEVELS.values[level_option_index]
        end
      end
    end
  end
end
