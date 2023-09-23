# frozen_string_literal: true

require './lib/game/modes/computer_vs_computer.rb'

RSpec.describe ::Game::Modes::ComputerVsComputer do
  describe ".configure_game" do
    before do
      allow_any_instance_of(::Game::Modes::ComputerVsComputer::Executor).to(
        receive(:watch_fight_message)
      )
    end

    subject { described_class.configure_game }

    it { expect(subject).to be_instance_of(::Game::Modes::ComputerVsComputer::Executor) }
  end
end
