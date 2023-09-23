# frozen_string_literal: true

require './lib/game/modes/human_vs_human.rb'

RSpec.describe ::Game::Modes::HumanVsHuman do
  describe ".configure_game" do
    subject { described_class.configure_game }

    it { expect(subject).to be_instance_of(::Game::Modes::HumanVsHuman::Executor) }
  end
end
