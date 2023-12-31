# frozen_string_literal: true

module Game
  module Rules
    private

    def play_rounds_under_rules(&round)
      until end_game?
        yield round if block_given?
      end
    end

    def win?(inner_board = board)
      winning_combinations.any? do |winning_combination|
        position_one, position_two, position_three = winning_combination

        combination = [
          inner_board[position_one],
          inner_board[position_two],
          inner_board[position_three]
        ]

        symbols = combination.uniq

        if symbols.one?
          @winning_symbol = symbols.first

          return true
        end

        false
      end
    end

    def tie?(inner_board = board)
      winning_combinations.all? do |winning_combination|
        position_one, position_two, position_three = winning_combination

        already_played_symbols = [
          inner_board[position_one],
          inner_board[position_two],
          inner_board[position_three]
        ]

        #
        # NOTE: is there more than one symbol in the combination? (not possible to win)
        #
        already_played_symbols.uniq.select do |played_symbol|
          playable_symbols.include?(played_symbol)
        end.count > 1
      end
    end

    def end_game?
      win? || tie?
    end

    def can_play_next_round?
      !end_game?
    end

    def available_move?(inner_board = board, position)
      !playable_symbols.include?(inner_board[position])
    end
  end
end
