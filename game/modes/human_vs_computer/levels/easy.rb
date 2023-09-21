# frozen_string_literal: true

require './game/modes/human_vs_computer/levels/base.rb'

module Modes
  module HumanVsComputer
    module Levels
      class Easy < Base
        def start
          under_rules do
            get_human_position

            if can_have_next_round?
              #
              # NOTE: playing as 'computer'
              #
              play_as_computer
            end
          end

          # TODO: check if user won
          puts "Game over"
        end

        private

        attr_reader :computer_symbol, :human_symbol
        #
        # NOTE: attempt to play as human_one
        #
        def get_human_position
          position = nil
          until position
            #
            # NOTE: waiting for user's evaluation
            #
            position = gets.chomp.to_i
            #
            # NOTE: validation of the symbol inputed by the user
            #
            if board[position] != "X" && board[position] != "O"
              @board[position] = human_symbol
            else
              #
              # NOTE: symbol does not exist (not possible symbol)
              #
              # TODO: improve error handling for invalid entries (ask for a new symbol)
              #
              position = nil
            end

            display_board
          end
        end

        def play_as_computer
          position = nil
          until position
            #
            # NOTE: hardcoded movement (always playing on the fourth unless unavailable)
            #
            if @board[4] == "4"
              position = 4
              @board[position] = @computer_symbol
            else
              #
              # NOTE: searching best dynamic movement
              #
              position = get_best_move(@board, @computer_symbol)
              #
              # NOTE: validating possible position
              #
              if available_move?(@board, position)
                @board[position] = @computer_symbol
              else
                #
                # NOTE: has already a symbol there (wrong movement - retrying)
                #
                # NOTE: useless piece of code - position would already be nil (auto-retry)
                #
                position = nil
              end

              display_board
            end
          end
        end

        #
        # NOTE: playing auto as computer
        #
        # TODO: improve level selection (use depth and best_score)
        #
        def get_best_move(board, next_player, depth = 0, best_score = {})
          available_spaces = []

          best_move = nil

          board.each do |s|
            if s != "X" && s != "O"
              #
              # NOTE: position not choosen yet
              #
              available_spaces << s
            end
          end
          available_spaces.each do |space|
            #
            # NOTE: faking the movement
            #
            @board[space.to_i] = @computer_symbol
            #
            # NOTE: was the winning movement?
            #
            if win?(board)
              best_move = space.to_i
              board[space.to_i] = space
              return best_move
            else
              @board[space.to_i] = @human_symbol
              #
              # NOTE: would it be the user winning movement?
              #
              if win?(board)
                best_move = space.to_i
                @board[space.to_i] = space
                return best_move
              else
                #
                # NOTE: just setting this position as 'already checked'
                #
                board[space.to_i] = space
              end
            end
          end
          #
          # NOTE: computer winning movement OR human possible winning movement
          #
          if best_move
            return best_move
          else
            #
            # NOTE: wouldn't make a win movement, and wouldn't directly impact the user
            #
            # TODO: improve level selection
            #
            n = rand(0..available_spaces.count)
            return available_spaces[n].to_i
          end
        end
        
      end
    end
  end
end
