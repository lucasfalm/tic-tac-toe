# frozen_string_literal: true

require './game/modes/base.rb'

require './game/helpers/play_as_human.rb'

require './game/modes/human_vs_computer/you_win_message.rb'
require './game/modes/human_vs_computer/game_over_message.rb'

module Game
  module Modes
    module ComputerVsComputer
      class Executor < ::Game::Modes::Base
        class << self
          def start
            self.new.start
          end
        end

        def initialize
          super

          @computer_one_symbol = X_SYMBOL
          @computer_two_symbol = O_SYMBOL

          ::Game::Helpers::ClearTerminalScreen.call
          watch_the_fight_message
        end

        def start
          under_rules { run_round_with_animation }

          winning_computer = begin
            return if winning_symbol.nil?

            computer_by_symbol(winning_symbol)
          end

          if win?
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

          if can_play_next_round?
            message_playing_with(computer_one_symbol)

            play_as_computer_one

            display_board
          end

          sleep(1)

          if can_play_next_round?
            message_playing_with(computer_two_symbol)

            play_as_computer_two

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

        def watch_the_fight_message
          puts "watch now the fight: computer one (symbol '#{computer_one_symbol}') vs computer two (symbol '#{computer_two_symbol}')"
          sleep(3)
          ::Game::Helpers::ClearTerminalScreen.call
          puts "3"
          sleep(0.5)
          puts "2"
          sleep(0.5)
          puts "1"
          sleep(0.5)
          puts "fight!"
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

        def play_as_computer(symbol:, against_symbol:)
          position = nil

          until position
            hard_or_easy = [
              get_best_move(symbol: symbol, against_symbol: against_symbol),
              get_random_move
            ]

            position = hard_or_easy.sample

            if available_move?(board, position)
              @board[position] = symbol
            else
              position = nil
            end
          end
        end
      end
    end
  end
end
