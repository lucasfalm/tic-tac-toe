# frozen_string_literal: true

require './interfaces/game_interface.rb'

#
# NOTE: command-line interface
#
module GameCli
  class << self
    def start_game
      ::GameInterface.start_game  
    end
  end
end

::GameCli.start_game
