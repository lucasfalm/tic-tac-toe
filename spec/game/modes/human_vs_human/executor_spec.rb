# frozen_string_literal: true

require './lib/game/modes/human_vs_human.rb'

RSpec.describe ::Game::Modes::HumanVsHuman::Executor do
  describe "#start" do
    subject { described_class.configure_game.start }

    before do
      allow(Kernel).to receive(:gets).and_return(
        double("Output", chomp: "0")
      )
    end

    it do
      expect { subject }.to output("something").to_stdout
    end
  end
end
