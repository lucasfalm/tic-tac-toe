# frozen_string_literal: true

module Game
  module Helpers
    module AvailableSpaces
      def available_spaces
        available_spaces = []

        board.each do |space|
          if !playable_symbols.include?(space)
            available_spaces << space
          end
        end

        available_spaces
      end
    end
  end
end
