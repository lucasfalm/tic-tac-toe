# frozen_string_literal: true

module Game
  module Helpers
    module PlayAsHuman
      module GetHumanMove
        module Cli
          class << self
            def call(symbol)
              sleep(0.3)
              puts "\nplay with symbol '#{symbol}' - enter [0-8]:"
              gets.chomp.to_i
            end
          end
        end
      end
    end
  end
end
