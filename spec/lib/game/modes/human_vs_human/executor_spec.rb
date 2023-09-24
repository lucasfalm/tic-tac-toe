# frozen_string_literal: true

require './lib/game/modes/human_vs_human.rb'

RSpec.describe ::Game::Modes::HumanVsHuman::Executor do
  describe "#start" do
    let(:game) { described_class.prepare }

    subject { game.start }

    let(:human_one_symbol) { "X" }
    let(:human_two_symbol) { "O" }

    # let(:human_one_symbol) { game.human_one_symbol }
    # let(:human_two_symbol) { game.human_two_symbol }

    context "human one wins" do
      before do
        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_one_symbol)
          .and_return(0, 1, 2)
        )

        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_two_symbol)
          .and_return(4, 5, 8)
        )
      end

      let(:expected_output) do
        <<~TEXT
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | O | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | 2
        ===+===+===
         3 | O | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | 2
        ===+===+===
         3 | O | O
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | X
        ===+===+===
         3 | O | O
        ===+===+===
         6 | 7 | 8

        ===+===+===

        human symbol 'X' win!
        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end

    context "human two wins" do
      before do
        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_one_symbol)
          .and_return(0, 1, 4)
        )

        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_two_symbol)
          .and_return(2, 5, 8)
        )
      end

      let(:expected_output) do
        <<~TEXT
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | 1 | O
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | O
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | O
        ===+===+===
         3 | 4 | O
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | O
        ===+===+===
         3 | X | O
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | O
        ===+===+===
         3 | X | O
        ===+===+===
         6 | 7 | O

        ===+===+===

        human symbol 'O' win!
        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end

    context "tie" do
      before do
        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_one_symbol)
          .and_return(4, 7, 2, 3)
        )

        allow_any_instance_of(described_class).to(
          receive(:get_human_move)
          .with(human_two_symbol)
          .and_return(8, 1, 6, 5)
        )
      end

      let(:expected_output) do
        <<~TEXT
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | 7 | O

        ===+===+===
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===
        ===+===+===

         0 | O | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===
        ===+===+===

         0 | O | X
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===
        ===+===+===

         0 | O | X
        ===+===+===
         3 | X | 5
        ===+===+===
         O | X | O

        ===+===+===
        ===+===+===

         0 | O | X
        ===+===+===
         X | X | 5
        ===+===+===
         O | X | O

        ===+===+===
        ===+===+===

         0 | O | X
        ===+===+===
         X | X | O
        ===+===+===
         O | X | O

        ===+===+===

        tie!

        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end
  end
end
