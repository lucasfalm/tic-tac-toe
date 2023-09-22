# frozen_string_literal: true

require './game/modes/base.rb'

module Game
  module Modes
    class ComputerVsComputer < ::Game::Modes::Base
      def initialize
        super

        @computer_one_symbol = X_SYMBOL
        @computer_two_symbol = O_SYMBOL

        ::Game::Helpers::ClearTerminalScreen.call
        watch_the_fight_message
      end

      def start
        under_rules do
          run_round_with_animation
        end
      end

      private

      attr_reader :computer_one_symbol, :computer_two_symbol

      def run_round_with_animation
        sleep(1)

        display_board
        puts "\n"

        if can_play_next_round?
          puts "\ncomputer one playing with '#{computer_one_symbol}'..."
          sleep(2)
          play_as_computer_one
        end

        sleep(1)

        if can_play_next_round?
          puts "\ncomputer two playing with '#{computer_two_symbol}'..."
          sleep(2)
          play_as_computer_two
        end

        winning_computer = begin
          return if winning_symbol.nil?

          if winning_symbol == computer_one_symbol
            "one"
          else
            "two"
          end
        end

        puts "\n"

        if winning_computer.nil?
          puts "tie!"
        else
          puts "finish! computer #{winning_computer} win!"
        end
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

            display_board
          else
            position = nil
          end
        end
      end
    end
  end
end
