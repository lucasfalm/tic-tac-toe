# frozen_string_literal: true

require './game/rules.rb'
require './game/winning_combinations.rb'
require './game/playable_symbols.rb'

require './game/helpers/clear_terminal_screen.rb'

module Game
  module Modes
    class Base
      class << self
        #
        # NOTE: by doing this, the child class will be the game
        #
        #       still, it can be overwrited for a custom initialization
        #
        def configure_game
          self.new
        end
      end

      include Rules
      include WinningCombinations
      include PlayableSymbols

      def initialize
        @board          = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
        @winning_symbol = nil

        display_board
      end

      def start; end

      private

      def display_board
        ::Game::Helpers::ClearTerminalScreen.call

        puts "===+===+===\n"
        puts "\n"
        puts " #{board[0]} | #{board[1]} | #{board[2]}"
        puts "===+===+===\n"
        puts " #{board[3]} | #{board[4]} | #{board[5]}"
        puts "===+===+===\n"
        puts " #{board[6]} | #{board[7]} | #{board[8]}"
        puts "\n"
        puts "===+===+===\n"
      end

      def available_spaces
        available_spaces = []

        board.each do |space|
          if !playable_symbols.include?(space)
            available_spaces << space
          end
        end

        available_spaces
      end

      attr_accessor :board, :winning_symbol
    end
  end
end
