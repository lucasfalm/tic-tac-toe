# frozen_string_literal: true

module Rules
  private

  def under_rules(&block)
    until win? || tie?
      yield block if block_given?
    end
  end

  def can_have_next_round?
    !win? && !tie?
  end

  def win?(inner_board = board)
    winning_combinations.any? do |winning_combination|
      position_one, position_two, position_three = winning_combination

      combination = [
        inner_board[position_one],
        inner_board[position_two],
        inner_board[position_three]
      ]

      combination.uniq.one?
    end
  end

  def tie?(inner_board = board)
    winning_combinations.all? do |winning_combination|
      position_one, position_two, position_three = winning_combination

      [
        inner_board[position_one],
        inner_board[position_two],
        inner_board[position_three]
      ].all? { |symbol| playable_symbols.include?(symbol) }
    end
  end

  def available_move?(inner_board = board, position)
    !playable_symbols.include?(inner_board[position])
  end
end
