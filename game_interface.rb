# frozen_string_literal: true

require './game/modes.rb'

class GameInterface
  class << self
    def start_game
      self.new.start_game
    end
  end

  include ::Game::Modes

  def start_game
    GAME_MODES
      .dig(requested_game_mode)
      .initialize_game
      .start
  end
end

GameInterface.start_game
