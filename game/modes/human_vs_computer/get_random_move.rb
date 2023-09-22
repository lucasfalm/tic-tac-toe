# frozen_string_literal: true

module Game
  module Modes
    module HumanVsComputer
      module GetRandomMove
        def get_random_move
          random_space = rand(0..available_spaces.count)

          available_spaces[random_space].to_i
        end
      end
    end
  end
end
