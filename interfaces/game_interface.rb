# frozen_string_literal: true

require './lib/game/modes.rb'

class GameInterface
  class << self
    def start_game
      self.new.start_game
    end
  end

  include ::Game::Modes

  def start_game
    request_game_by_mode
      .configure_game
      .start
  end
end
