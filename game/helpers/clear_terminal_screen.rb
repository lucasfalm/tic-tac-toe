# frozen_string_literal: true

module Game
  module Helpers
    module ClearTerminalScreen
      class << self
        def call
          system("clear") || system("cls")
        end
      end
    end
  end
end
