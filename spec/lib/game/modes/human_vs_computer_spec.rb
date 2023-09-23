# frozen_string_literal: true

require './lib/game/modes/human_vs_computer.rb'

RSpec.describe ::Game::Modes::HumanVsComputer do
  describe ".configure_game" do
    subject { described_class.configure_game }
  end
end
