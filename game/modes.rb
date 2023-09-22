# frozen_string_literal: true

require './game/modes/human_vs_computer.rb'
require './game/modes/computer_vs_computer.rb'
require './game/modes/human_vs_human.rb'

require './game/helpers/clear_terminal_screen'

module Game
  module Modes
    class InvalidGameMode < StandardError
      def initialize(message = "invalid game mode")
        super
      end
    end

    GAME_MODES = {
      "computer vs computer" => ::Game::Modes::ComputerVsComputer,
      "human vs computer"    => ::Game::Modes::HumanVsComputer,
      "human vs human"       => ::Game::Modes::HumanVsHuman,
    }.freeze

    def request_game_by_mode
      game_mode_klass = choose_game_mode_prompt

      raise(InvalidGameMode) if game_mode_klass.nil?

      game_mode_klass

    rescue InvalidGameMode then retry
    end

    private

    def choose_game_mode_prompt
      ::Game::Helpers::ClearTerminalScreen.call

      puts "choose game mode:"
      GAME_MODES.each_with_index do |(game_mode_name, _game_mode_klass), index|
        puts "#{index}. #{game_mode_name}"
      end

      game_option_index = gets.chomp.to_i

      GAME_MODES.values.at(game_option_index)
    end
  end
end
