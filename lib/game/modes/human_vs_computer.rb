# frozen_string_literal: true

require './lib/game/modes/human_vs_computer/levels/available.rb'

require './lib/game/helpers/clear_terminal_screen.rb'

module Game
  module Modes
    module HumanVsComputer
      class InvalidLevelOption < StandardError
        def initialize(message = "invalid level option")
          super
        end
      end

      extend ::Game::Modes::HumanVsComputer::Levels::Available

      class << self
        def configure_game
          requested_level = choose_level_prompt
          requested_level.prepare

        rescue InvalidLevelOption then retry
        end

        private

        def choose_level_prompt
          ::Game::Helpers::ClearTerminalScreen.call

          puts "choose level:"
          HUMAN_VS_COMPUTER_AVAILABLE_LEVELS.each_with_index do |(level_name, _level_klass), index|
            puts "#{index}. #{level_name}"
          end

          level_option_index = gets.chomp.to_i

          raise InvalidLevelOption unless HUMAN_VS_COMPUTER_AVAILABLE_LEVELS.values.at(level_option_index)

          HUMAN_VS_COMPUTER_AVAILABLE_LEVELS.values[level_option_index]
        end
      end
    end
  end
end
