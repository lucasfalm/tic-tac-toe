# frozen_string_literal: true

require './game/modes/base.rb'

require './game/modes/computer_vs_computer/watch_fight_message.rb'
require './game/modes/computer_vs_computer/play_as_computer.rb'

module Game
  module Modes
    module ComputerVsComputer
      class Executor < ::Game::Modes::Base
        class << self
          def start
            self.new.start
          end
        end

        include ::Game::Modes::ComputerVsComputer::WatchFightMessage
        include ::Game::Modes::ComputerVsComputer::PlayAsComputer

        def initialize
          super

          @computer_one_symbol = X_SYMBOL
          @computer_two_symbol = O_SYMBOL

          ::Game::Helpers::ClearTerminalScreen.call
          watch_fight_message
        end

        def start
          under_rules { run_round_with_animation }

          if win?
            winning_computer = computer_by_symbol(winning_symbol)

            puts "\nfinish! computer #{winning_computer} win with '#{winning_symbol}'!"
          else
            puts "\ntie!"
          end
        end

        private

        attr_reader :computer_one_symbol, :computer_two_symbol

        def run_round_with_animation
          sleep(1)
          display_board

          attempt_to_play_with(computer_one_symbol)
          sleep(1)
          attempt_to_play_with(computer_two_symbol)
        end

        def attempt_to_play_with(computer_symbol)
          if can_play_next_round?
            message_playing_with(computer_symbol)

            if computer_symbol == computer_one_symbol
              play_as_computer_one
            else
              play_as_computer_two
            end

            display_board
          end
        end

        def message_playing_with(computer_symbol)
          computer = computer_by_symbol(computer_symbol)
          puts "\n\ncomputer #{computer} playing with '#{computer_symbol}'..."
          sleep(2)
        end

        def computer_by_symbol(symbol)
          symbol == computer_one_symbol ? "one" : "two"
        end

        def play_as_computer_one
          play_as_computer(
            symbol: computer_one_symbol, against_symbol: computer_two_symbol
          )
        end

        def play_as_computer_two
          play_as_computer(
            symbol: computer_two_symbol, against_symbol: computer_one_symbol
          )
        end
      end
    end
  end
end
