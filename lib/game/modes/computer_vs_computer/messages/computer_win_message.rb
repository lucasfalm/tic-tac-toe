# frozen_string_literal: true

module Game
  module Modes
    module ComputerVsComputer
      module Messages
        module ComputerWinMessage
          def computer_win_message(computer, symbol)
            puts "\nfinish! computer #{computer} win with '#{symbol}'!\n"
          end
        end
      end
    end
  end
end
