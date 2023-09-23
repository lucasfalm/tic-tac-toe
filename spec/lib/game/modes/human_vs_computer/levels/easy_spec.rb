# frozen_string_literal: true

require './lib/game/modes/human_vs_computer/levels/easy.rb'

require './spec/lib/game/modes/human_vs_computer/levels/shared_context.rb'

RSpec.describe ::Game::Modes::HumanVsComputer::Levels::Easy do
  describe "#start" do
    let(:game) { described_class.prepare }

    subject { game.start }

    let(:human_symbol)    { "O" }
    let(:computer_symbol) { "X" }

    context "human wins" do
      include_context "variables - when the human wins"

      before do
        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_symbol)
          .and_return(*human_movements)
        )

        allow_any_instance_of(described_class).to(
          receive(:get_random_move)
          .and_return(*computer_movements)
        )
      end

      it_behaves_like "when the human wins"
    end

    context "computer wins" do
      include_context "variables - when the computer wins"

      before do
        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_symbol)
          .and_return(*human_movements)
        )

        allow_any_instance_of(described_class).to(
          receive(:get_random_move)
          .and_return(*computer_movements)
        )
      end

      it_behaves_like "when the computer wins"
    end

    context "tie" do
      include_context "variables - when ties"

      before do
        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_symbol)
          .and_return(*human_movements)
        )

        allow_any_instance_of(described_class).to(
          receive(:get_random_move)
          .and_return(*computer_movements)
        )
      end

      it_behaves_like "when ties"
    end
  end
end
