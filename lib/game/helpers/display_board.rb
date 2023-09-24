# frozen_string_literal: true

module Game
  module Helpers
    module DisplayBoard
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
    end
  end
end
