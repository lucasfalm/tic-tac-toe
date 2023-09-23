# frozen_string_literal: true

require './interfaces/game_interface.rb'

RSpec.describe ::GameInterface do
  describe ".start_game" do
    subject { described_class.start_game }
  end
end
