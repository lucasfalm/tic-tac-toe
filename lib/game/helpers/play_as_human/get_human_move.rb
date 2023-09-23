# frozen_string_literal: true

require './lib/game/helpers/play_as_human/get_human_move/cli.rb'

module Game
  module Helpers
    module PlayAsHuman
      module GetHumanMove
        def get_human_move(symbol)
          ::Game::Helpers::PlayAsHuman::GetHumanMove::Cli.get_human_move(symbol)
        end
      end
    end
  end
end
