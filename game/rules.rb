# frozen_string_literal: true

module Rules
  private

  def under_rules(&block)
    until win? || tie?
      yield block if block_given?
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

  def can_play_next_round?
    !win? && !tie?
  end

  def available_move?(inner_board = board, position)
    !playable_symbols.include?(inner_board[position])
  end
end
