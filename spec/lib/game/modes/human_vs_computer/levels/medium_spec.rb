# frozen_string_literal: true

require './lib/game/modes/human_vs_computer/levels/medium.rb'

require './spec/lib/game/modes/human_vs_computer/levels/shared_context.rb'

RSpec.describe ::Game::Modes::HumanVsComputer::Levels::Medium do
  describe "#start" do
    let(:game) { described_class.configure_game }

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
          receive(:hard_or_easy)
          .with(symbol: computer_symbol, against_symbol: human_symbol)
          .and_return(*computer_movements.map { |move| [move] })
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
          receive(:hard_or_easy)
          .with(symbol: computer_symbol, against_symbol: human_symbol)
          .and_return(*computer_movements.map { |move| [move] })
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
          receive(:hard_or_easy)
          .with(symbol: computer_symbol, against_symbol: human_symbol)
          .and_return(*computer_movements.map { |move| [move] })
        )
      end

      it_behaves_like "when ties"
    end
  end
end
