# frozen_string_literal: true

module Game
  module Modes
    module ComputerVsComputer
      module WatchFightMessage
        def watch_fight_message
          puts "watch now the fight: computer one (symbol '#{computer_one_symbol}') vs computer two (symbol '#{computer_two_symbol}')"
          sleep(3)
          ::Game::Helpers::ClearTerminalScreen.call
          puts "3"
          sleep(0.5)
          puts "2"
          sleep(0.5)
          puts "1"
          sleep(0.5)
          puts "fight!"
        end
      end
    end
  end
end
