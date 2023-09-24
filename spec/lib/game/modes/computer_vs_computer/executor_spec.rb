# frozen_string_literal: true

require './lib/game/modes/computer_vs_computer.rb'

RSpec.describe ::Game::Modes::ComputerVsComputer::Executor do
  describe "#start" do
    let(:game) { described_class.prepare }

    subject { game.start }

    let(:computer_one_symbol) { "X" }
    let(:computer_two_symbol) { "O" }

    before do
      allow_any_instance_of(described_class).to receive(:watch_fight_message)
      allow_any_instance_of(described_class).to receive(:sleep)
      allow(Game::Helpers::ClearTerminalScreen).to receive(:call)
    end

    context "computer one wins" do
      before do
        allow_any_instance_of(described_class).to(
          receive(:hard_or_easy)
          .with(symbol: computer_one_symbol, against_symbol: computer_two_symbol)
          .and_return([0], [1], [2])
        )

        allow_any_instance_of(described_class).to(
          receive(:hard_or_easy)
          .with(symbol: computer_two_symbol, against_symbol: computer_one_symbol)
          .and_return([4], [5], [8])
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
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | O | 5
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


        computer one playing with 'X'...
        ===+===+===

         X | X | 2
        ===+===+===
         3 | O | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | X | 2
        ===+===+===
         3 | O | O
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


        computer one playing with 'X'...
        ===+===+===

         X | X | X
        ===+===+===
         3 | O | O
        ===+===+===
         6 | 7 | 8

        ===+===+===

        finish! computer one win with 'X'!
        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end

    context "computer two wins" do
      before do
        allow_any_instance_of(described_class).to(
          receive(:hard_or_easy)
          .with(symbol: computer_one_symbol, against_symbol: computer_two_symbol)
          .and_return([0], [1], [4])
        )

        allow_any_instance_of(described_class).to(
          receive(:hard_or_easy)
          .with(symbol: computer_two_symbol, against_symbol: computer_one_symbol)
          .and_return([2], [5], [8])
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
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | 1 | O
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


        computer one playing with 'X'...
        ===+===+===

         X | X | O
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
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
         3 | 4 | O
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | X | O
        ===+===+===
         3 | X | O
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | X | O
        ===+===+===
         3 | X | O
        ===+===+===
         6 | 7 | O

        ===+===+===

        finish! computer two win with 'O'!
        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end

    context "tie" do
      before do
        allow_any_instance_of(described_class).to(
          receive(:hard_or_easy)
          .with(symbol: computer_one_symbol, against_symbol: computer_two_symbol)
          .and_return([4], [7], [2], [3])
        )

        allow_any_instance_of(described_class).to(
          receive(:hard_or_easy)
          .with(symbol: computer_two_symbol, against_symbol: computer_one_symbol)
          .and_return([8], [1], [6], [5])
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
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
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
         6 | 7 | O

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         0 | O | 2
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


        computer one playing with 'X'...
        ===+===+===

         0 | O | X
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===


        computer two playing with 'O'...
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
         3 | X | 5
        ===+===+===
         O | X | O

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         0 | O | X
        ===+===+===
         X | X | 5
        ===+===+===
         O | X | O

        ===+===+===


        computer two playing with 'O'...
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
