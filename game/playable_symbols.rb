# frozen_string_literal: true

module Game
  module PlayableSymbols
    X_SYMBOL = "X"
    O_SYMBOL = "O"

    def playable_symbols
      [
        X_SYMBOL, O_SYMBOL
      ]
    end
  end
end
