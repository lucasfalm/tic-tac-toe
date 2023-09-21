# frozen_string_literal: true

require './game/rules.rb'
require './game/winning_combinations.rb'
require './game/playable_symbols.rb'

module Game
  module Modes
    class Base
      class << self
        def initialize_game
          self.new
        end
      end

      include Rules
      include WinningCombinations
      include PlayableSymbols

      def initialize
        @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

        display_board
      end

      def start; end

      private

      def display_board
        puts "\n"
        puts " #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n"
        puts "\n"
      end

      attr_accessor :board
    end
  end
end
