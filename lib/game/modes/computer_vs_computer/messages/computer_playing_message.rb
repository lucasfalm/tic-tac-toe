# frozen_string_literal: true

module Game
  module Modes
    module ComputerVsComputer
      module Messages
        module ComputerPlayingMessage
          def computer_playing_message(computer, symbol)
            puts "\n\ncomputer #{computer} playing with '#{symbol}'..."
          end
        end
      end
    end
  end
end
